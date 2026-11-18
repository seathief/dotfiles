# Environment shared by interactive and non-interactive fish sessions.
# PATH additions and the GNU toolchain live in conf.d/10-from-zsh-env.fish;
# interactive aliases and tool hooks live in conf.d/50-from-zsh-interactive.fish.

# Match the zsh toolchain precedence without accumulating duplicate PATH entries.
fish_add_path --path \
    /opt/homebrew/share/google-cloud-sdk/bin \
    /opt/homebrew/opt/libxml2/bin \
    /opt/homebrew/opt/rustup/bin \
    $HOME/.bun/bin \
    $HOME/.antigravity-ide/antigravity-ide/bin \
    $HOME/Library/pnpm \
    $HOME/Library/pnpm/bin \
    $HOME/bin
fish_add_path --path --append $HOME/.lmstudio/bin /Applications/Obsidian.app/Contents/MacOS

if test -f $HOME/.orbstack/shell/init2.fish
    source $HOME/.orbstack/shell/init2.fish
end

set -gx PNPM_HOME $HOME/Library/pnpm
# Let the selected Go installation determine GOROOT (including mise versions).
set -e GOROOT
set -gx COLORTERM truecolor
set -gx STARSHIP_LOG error

if status is-interactive
    alias emacs 'emacs -nw'
    alias agy 'agy --dangerously-skip-permissions'

    if command -q ngrok
        ngrok completion fish | source
    end

    # Fish provides highlighting, autosuggestions and completion natively.
    bind ctrl-o zoxide_fzf
    if command -q starship
        starship init fish | source
    end
end
