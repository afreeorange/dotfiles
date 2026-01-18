function draw_line
    set LINE_CHAR $argv[1]
    set WIDTH (tput cols)
    printf '%*s' $WIDTH '' | tr ' ' $LINE_CHAR
end
