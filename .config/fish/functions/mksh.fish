function mksh
    if test (count $argv) -ne 1
        echo 'mksh takes one argument' >&2
        return 1
    else if test -e $argv[1]
        echo "$argv[1] already exists" >&2
        return 1
    end

    echo '#!/bin/env bash
set -euo pipefail

' >$argv[1]

    chmod u+x $argv[1]
end
