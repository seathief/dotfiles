# Ported from ~/.zshenv, ~/.zprofile and the export lines of ~/.zshrc (2026-10-06).
# Loaded by every fish, including non-interactive ssh commands; the zsh files are left untouched.

# Homebrew (zprofile: brew shellenv; zshenv: /opt/homebrew/bin + sbin)
if test -x /opt/homebrew/bin/brew
    /opt/homebrew/bin/brew shellenv fish | source
end

# zshenv: cargo, OrbStack docker over ssh, remote-secondmate entrypoint
fish_add_path -g $HOME/.cargo/bin $HOME/.orbstack/bin $HOME/.local/bin

# zshrc: GNU tools ahead of the BSD ones
fish_add_path -g \
    /opt/homebrew/opt/findutils/libexec/gnubin \
    /opt/homebrew/opt/gnu-tar/libexec/gnubin \
    /opt/homebrew/opt/gnu-sed/libexec/gnubin \
    /opt/homebrew/opt/grep/libexec/gnubin \
    /opt/homebrew/opt/gawk/libexec/gnubin \
    /opt/homebrew/opt/inetutils/libexec/gnubin

# zshrc: doom emacs, golang, PostgreSQL, Windsurf
set -gx GOROOT /opt/homebrew/opt/go/libexec
set -gx GOPATH $HOME/go
fish_add_path -g $HOME/.emacs.d/bin $GOPATH/bin $GOROOT/bin \
    /opt/homebrew/opt/postgresql@16/bin $HOME/.codeium/windsurf/bin

# zshrc exports
set -gx HOMEBREW_AUTO_UPDATE_SECS 43200
set -gx LANG en_US.UTF-8
set -gx LC_ALL en_US.UTF-8
set -gx EDITOR nvim
set -gx ENABLE_LSP_TOOL 1

# fzf (zshenv sets these; zshrc later overrides FZF_DEFAULT_OPTS, so the zshrc value wins here too)
set -gx FZF_ALT_C_COMMAND 'fd --type directory'
set -gx FZF_CTRL_T_COMMAND 'mdfind -onlyin . -name .'
set -gx FZF_DEFAULT_COMMAND 'fd --type file'
set -gx FZF_DEFAULT_OPTS "--bind='ctrl-o:execute(code {})+abort'"
