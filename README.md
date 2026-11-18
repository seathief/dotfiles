# 設定檔位置

- zsh
  - 主設定檔：`~/.zshrc`
  - 輔助腳本：`~/.zsh/helper.sh`
  - Pi profiles：`~/.zsh/pi-profiles.sh`
  - `picoding` 使用 coding profile，`pisurvey` 使用 survey profile，`piuse` 使用 computer-use profile
  - 兩者皆以 `PI_CODING_AGENT_SESSION_DIR` 指定共用工作階段目錄 `~/.pi/sessions`

- fish
  - 主設定檔：`~/.config/fish/config.fish`
  - Pi profiles：`~/.config/fish/functions/{picoding,piflare,pisurvey,piuse}.fish`
  - zoxide 選取：`~/.config/fish/functions/zoxide_fzf.fish`
  - 不含備份檔、歷史紀錄、`fish_variables` 與自動產生的 completions。

- git
  - 全域設定檔：`~/.gitconfig`
  - 全域忽略設定：`~/.gitignore_global`
  - 不設 `core.hooksPath`：全域 hook 會吃掉各 repo 自己的 hook
  - 新 worktree 要帶 `.env` 時手動跑 `~/bin/worktree-sync-env.sh`

- herdr
  - 設定檔：`~/.config/herdr/config.toml`

- tmux
  - 設定檔：`~/.tmux.conf`

- gpg-agent
  - 設定檔：`private_dot_gnupg/gpg-agent.conf.tmpl`

- claude code
  - 設定檔：`~/.claude/CLAUDE.md`

- gemini cli
  - 設定檔：`~/.gemini/GEMINI.md`