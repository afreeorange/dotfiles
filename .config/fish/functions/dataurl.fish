function dataurl
    set MIMETYPE (file -b --mime-type $argv[1])

    if string match -q "text/*" $MIMETYPE
        set MIMETYPE "$MIMETYPE;charset=utf-8"
    end

    echo "data:$MIMETYPE;base64,"(openssl base64 -in $argv[1] | tr -d '\n')
end
