# Environment shared by interactive and non-interactive fish sessions.
if test -x /opt/homebrew/bin/brew
    /opt/homebrew/bin/brew shellenv fish | source
end

# Match the zsh toolchain precedence without accumulating duplicate PATH entries.
fish_add_path --path \
    /opt/homebrew/share/google-cloud-sdk/bin \
    /opt/homebrew/opt/libxml2/bin \
    /opt/homebrew/opt/rustup/bin \
    $HOME/.bun/bin \
    $HOME/.antigravity-ide/antigravity-ide/bin \
    $HOME/.local/bin \
    $HOME/.codeium/windsurf/bin \
    $HOME/go/bin \
    $HOME/.emacs.d/bin \
    $HOME/Library/pnpm \
    $HOME/Library/pnpm/bin \
    /opt/homebrew/opt/inetutils/libexec/gnubin \
    /opt/homebrew/opt/gawk/libexec/gnubin \
    /opt/homebrew/opt/grep/libexec/gnubin \
    /opt/homebrew/opt/gnu-sed/libexec/gnubin \
    /opt/homebrew/opt/gnu-tar/libexec/gnubin \
    /opt/homebrew/opt/findutils/libexec/gnubin \
    $HOME/bin
fish_add_path --path --append $HOME/.lmstudio/bin /Applications/Obsidian.app/Contents/MacOS

if test -f $HOME/.orbstack/shell/init2.fish
    source $HOME/.orbstack/shell/init2.fish
end

set -gx PNPM_HOME $HOME/Library/pnpm
set -gx GOPATH $HOME/go
# Let the selected Go installation determine GOROOT (including mise versions).
set -e GOROOT
set -gx EDITOR nvim
set -gx LANG en_US.UTF-8
set -gx LC_ALL en_US.UTF-8
set -gx COLORTERM truecolor
set -gx STARSHIP_LOG error
set -gx HOMEBREW_AUTO_UPDATE_SECS 43200
set -gx ENABLE_LSP_TOOL 1
set -gx FZF_DEFAULT_COMMAND 'fd --type file'
set -gx FZF_DEFAULT_OPTS "--bind='ctrl-o:execute(code {})+abort'"

if status is-interactive
    alias ls 'eza --grid --color auto --icons --sort=type'
    alias ll 'eza --long --color always --icons --sort=type'
    alias la 'eza --grid --all --color auto --icons --sort=type'
    alias lla 'eza --long --all --color auto --icons --sort=type'
    alias lr 'eza -lR'
    alias vim nvim
    alias emacs 'emacs -nw'
    alias du 'ncdu --color dark -rr -x --exclude .git --exclude node_modules'
    alias agy 'agy --dangerously-skip-permissions'

    if command -q mise
        mise activate fish | source
    end
    if command -q fzf
        fzf --fish | source
    end
    if command -q zoxide
        zoxide init fish | source
    end
    if command -q thefuck
        thefuck --alias | source
    end
    if command -q ngrok
        ngrok completion fish | source
    end
    if test "$TERM_PROGRAM" = vscode; and command -q code
        set -l integration (code --locate-shell-integration-path fish)
        if test -f "$integration"
            source "$integration"
        end
    end

    # Fish provides highlighting, autosuggestions and completion natively.
    bind ctrl-o zoxide_fzf
    if command -q starship
        starship init fish | source
    end
end
