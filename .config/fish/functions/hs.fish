function hs
    set WORKING_DIR (pwd)

    if test -n "$argv[1]"
        set WORKING_DIR $argv[1]
    end

    echo "Using this as root: $WORKING_DIR"
    echo "Starting server at"
    echo "http://127.0.0.1:8080"
    echo "─────────────────────────────────────────────────────────────────"

    caddy file-server \
        --access-log \
        --browse \
        --reveal-symlinks \
        --listen 127.0.0.1:8080 \
        --root $WORKING_DIR
end
