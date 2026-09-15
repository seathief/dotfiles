#!/usr/bin/env bash
set -euo pipefail

detect_current_root() {
  if git rev-parse --show-toplevel >/dev/null 2>&1; then
    git rev-parse --show-toplevel
  elif command -v jj >/dev/null 2>&1 && jj workspace root >/dev/null 2>&1; then
    jj workspace root
  else
    pwd -P
  fi
}

current_root="${WORKTREE_SYNC_ENV_CURRENT_ROOT:-$(detect_current_root)}"

main_root="${WORKTREE_SYNC_ENV_MAIN_ROOT:-}"
if [[ -z "$main_root" ]]; then
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
fi

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

# Find all gitignored .env* files (and .envrc), plus mise.toml, in the main worktree,
# then copy them into secondary worktrees.
count=0
while IFS= read -r rel_path; do
  src="$main_root/$rel_path"
  dst="$current_root/$rel_path"
  mkdir -p "$(dirname "$dst")"
  cp -f "$src" "$dst"
  echo "[worktree-sync-env] copied $rel_path"
  if [[ "$rel_path" == "mise.toml" ]] && command -v mise >/dev/null 2>&1; then
    mise trust -y -q "$dst"
    echo "[worktree-sync-env] trusted $rel_path"
  fi
  count=$((count + 1))
done < <(
  cd "$main_root"
  {
    fd -H --no-ignore-vcs -E .worktrees -t f '\.env' | while read -r f; do
      if git check-ignore -q "$f" 2>/dev/null; then
        echo "$f"
      fi
    done
    [[ -f mise.toml ]] && echo "mise.toml"
  } | sort -u
)

if [[ $count -eq 0 ]]; then
  echo "[worktree-sync-env] no gitignored env files found"
else
  echo "[worktree-sync-env] synced $count file(s)"
fi
