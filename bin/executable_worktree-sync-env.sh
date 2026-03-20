#!/usr/bin/env bash
set -euo pipefail

current_root="$(git rev-parse --show-toplevel)"

main_root=""
while IFS= read -r line; do
  case "$line" in
    worktree\ *)
      wt_path="${line#worktree }"
      if [[ -d "$wt_path/.git" ]]; then
        main_root="$wt_path"
        break
      fi
      ;;
  esac
done < <(git worktree list --porcelain)

if [[ -z "$main_root" ]]; then
  main_root="$(git worktree list --porcelain | head -n 1 | sed 's/^worktree //')"
fi

if [[ -z "$main_root" ]]; then
  echo "[worktree-sync-env] failed to detect main worktree"
  exit 1
fi

if [[ "$current_root" == "$main_root" ]]; then
  exit 0
fi

# Find all gitignored .env* files (and .envrc) in the main worktree, then copy them
count=0
while IFS= read -r rel_path; do
  src="$main_root/$rel_path"
  dst="$current_root/$rel_path"
  mkdir -p "$(dirname "$dst")"
  cp -f "$src" "$dst"
  echo "[worktree-sync-env] copied $rel_path"
  count=$((count + 1))
done < <(cd "$main_root" && fd -H --no-ignore-vcs -t f '\.env' | while read -r f; do
  git check-ignore -q "$f" 2>/dev/null && echo "$f"
done)

if [[ $count -eq 0 ]]; then
  echo "[worktree-sync-env] no gitignored env files found"
else
  echo "[worktree-sync-env] synced $count file(s)"
fi
