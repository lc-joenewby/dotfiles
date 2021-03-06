#!/bin/bash

cd "$(dirname "$BASH_SOURCE")" \
    && source 'utils.sh'

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

set_github_ssh_key() {

    declare -r GITHUB_SSH_URL='https://github.com/settings/ssh'
    local sshKeyFile='localcover_rsa.pub'
    local workingDirectory="$(pwd)"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    cd "$HOME/.ssh"

    # Setup GitHub SSH Key
    # https://help.github.com/articles/generating-ssh-keys

    print_info 'Set up the SSH key'

    if [ ! -r "$sshKeyFile" ]; then
        rm -rf "$sshKeyFile"
        ask 'Please provide an email address (email): ' && printf '\n'
        ssh-keygen -t rsa -C "$(get_answer)"
    fi

    if cmd_exists 'open' && cmd_exists 'pbcopy'; then

        # Copy SSH key to clipboard
        cat "$sshKeyFile" | pbcopy
        print_result $? "Copy SSH key to clipboard"

        # Open the GitHub web page where the SSH key can be added
        open "$GITHUB_SSH_URL"

    elif cmd_exists 'xclip' && cmd_exists 'xdg-open'; then

        # Copy SSH key to clipboard
        cat "$sshKeyFile" | xclip -selection clip
        print_result $? "Copy SSH key to clipboard"

        # Open the GitHub web page where the SSH key can be added
        xdg-open "$GITHUB_SSH_URL"

    fi

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # Before proceeding, wait for everything to be ok

    while true; do

        ssh -T git@github.com &> /dev/null
        [ $? -eq 1 ] && break

        sleep 5

    done

    print_success 'Set up the SSH key'

    cd "$workingDirectory"

}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

    if is_git_repository; then

        ssh -T git@github.com &> /dev/null
        [ $? -ne 1 ] && set_github_ssh_key

        # Update content and remove untracked files
        git fetch --all &> /dev/null \
            && git reset --hard origin/master &> /dev/null \
            && git clean -fd  &> /dev/null

        print_result $? 'Update content'

    fi

}

main
