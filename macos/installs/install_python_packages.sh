#!/bin/bash

cd "$(dirname "$BASH_SOURCE")" \
    && source '../utils.sh'
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

declare -r -a PYTHON_PACKAGES=(
    'pylint'
    'yapf'
    'google.cloud'
)

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {
    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # Check if `python3` is installed

    if ! cmd_exists 'python3'; then
        print_error 'python3 is required, please install it!\n'
        exit 1
    fi

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # Install the `python3` packages

    for i in ${PYTHON_PACKAGES[@]}; do
        execute "python3 -m pip install $i" "$i"
    done

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # Check if `python2` is installed

    if ! cmd_exists 'python2'; then
        print_error 'python2 is required, please install it!\n'
        exit 1
    fi

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # Install the `python2` packages

    for i in ${PYTHON_PACKAGES[@]}; do
        execute "python2 -m pip install $i" "$i"
    done

}

main
