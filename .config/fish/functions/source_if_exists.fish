function source_if_exists
    test -e $argv[1]; and source $argv[1]
end
