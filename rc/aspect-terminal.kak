declare-option -docstring 'When width / height is greater than this, a horizontal split is used' str aspect_terminal_ratio 2

define-command -override aspect-terminal -params 1.. -docstring 'Open a new terminal using either terminal-vertical or terminal-horizontal
    based on the aspect ratio of the current client' %{
    %sh{
        if [ 1 -eq "$(printf "%f / %f > %f" "$kak_window_width" "$kak_window_height" "$kak_opt_aspect_terminal_ratio" | bc)" ]
        then
            printf %s "terminal-horizontal"
        else
            printf %s "terminal-vertical"
        fi
    } %arg{@}
}
