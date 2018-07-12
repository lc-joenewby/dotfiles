#!/bin/bash

cd "$(dirname "$BASH_SOURCE")" \
    && source '../utils.sh'

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {
    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # Check if `python2` is installed

    if ! cmd_exists 'python2'; then
        print_error 'python2 is required, please install it!\n'
        exit 1
    fi

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # Install `Google Cloud SDK`

    execute "curl https://sdk.cloud.google.com | bash" "Google Cloud SDK"

}

main
