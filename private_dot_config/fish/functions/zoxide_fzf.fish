function zoxide_fzf --description 'Insert a directory from zoxide using fzf'
    set -l selection (zoxide query --list | fzf --height 40% --reverse --border)
    or begin
        commandline --function repaint
        return 0
    end

    if test -n "$selection"
        commandline --insert -- (string escape -- "$selection")
    end
    commandline --function repaint
end
