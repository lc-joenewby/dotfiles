#!/bin/bash

cd "$(dirname "$BASH_SOURCE")" \
    && source '../utils.sh' \
    && source './utils.sh'

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

    # Homebrew Casks
    # https://github.com/caskroom/homebrew-cask

    if cmd_exists 'brew' \
        && brew_tap 'caskroom/cask'; then

        brew_install 'Homebrew Cask' 'caskroom/cask/brew-cask'
        printf '\n'

        brew_install 'Java' 'java' 'cask'
        brew_install 'Atom' 'atom' 'cask'
        brew_install 'Visual Studio Code' 'visual-studio-code' 'cask'
        brew_install 'Postman' 'postman' 'cask'
        brew_install 'Chrome' 'google-chrome' 'cask'
        brew_install 'Chromium' 'chromium' 'cask'
        brew_install 'Firefox' 'firefox' 'cask'
        brew_install 'ImageOptim' 'imageoptim' 'cask'
        brew_install 'Opera' 'opera' 'cask'
        brew_install 'Spectacle' 'spectacle' 'cask'
        brew_install 'Unarchiver' 'the-unarchiver' 'cask'
        brew_install 'Slack' 'slack' 'cask'

    fi

}

main
