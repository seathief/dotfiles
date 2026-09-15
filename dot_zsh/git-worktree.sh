# git worktree + git-crypt integration
# Usage: gtr-new <branch> [--from <ref>] [other gtr flags]
gtr-new() {
  git-crypt lock && \
  git gtr new "$@" && \
  git checkout -- data/db/ && \
  git-crypt unlock ~/.git-crypt-niche-key
}
