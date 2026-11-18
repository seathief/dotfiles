# Ported from the interactive part of ~/.zshrc (2026-10-06); the zsh files are left untouched.
status is-interactive; or return

# aliases
alias vim nvim
alias ls 'eza --grid --color auto --icons --sort=type'
alias ll 'eza --long --color always --icons --sort=type'
alias la 'eza --grid --all --color auto --icons --sort=type'
alias lla 'eza --long --all --color auto --icons --sort=type'
alias lr 'eza -lR'
alias gawk awk
alias touch gtouch
alias du 'ncdu --color dark -rr -x --exclude .git --exclude node_modules'
alias j 'zoxide jump'
alias claude-mem 'bun "/Users/seathief/.claude/plugins/marketplaces/thedotmack/plugin/scripts/worker-service.cjs"'

# tool hooks
command -q mise; and mise activate fish | source
command -q zoxide; and zoxide init fish | source
command -q fzf; and fzf --fish | source
command -q thefuck; and thefuck --alias | source

# gpg agent, also used for ssh
set -gx GPG_TTY (tty)
gpg-connect-agent updatestartuptty /bye >/dev/null 2>&1
set -gx SSH_AUTH_SOCK (gpgconf --list-dirs agent-ssh-socket)
if not pgrep -u "$USER" gpg-agent >/dev/null
    gpg-agent --daemon --enable-ssh-support >/dev/null 2>&1
end

# vscode terminal integration
if test "$TERM_PROGRAM" = vscode; and command -q code
    set -l integration (code --locate-shell-integration-path fish)
    if test -f "$integration"
        source "$integration"
    end
end
