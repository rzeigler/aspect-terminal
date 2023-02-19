declare-option -docstring 'When width / height is greater than this, a horizontal split is used' str aspect_terminal_ratio 2

define-command -override aspect-terminal -docstring 'Open a new terminal using either terminal-vertical or terminal-horizontal
    based on the aspect ratio of the current client' %{
    evaluate-commands %sh{
        expr=$(printf "%f / %f > %f" "$kak_window_width" "$kak_window_height" "$kak_opt_aspect_terminal_ratio" )
        echo $expr 1>&2
        if [ 1 -eq "$(printf %s $expr | bc)" ]
        then
            printf %s "terminal-horizontal"
        else
            printf %s "terminal-vertical"
        fi
    }
}
