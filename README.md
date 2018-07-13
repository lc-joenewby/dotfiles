# Dotfiles

## Setup
`bash -c "$(curl -LsS https://raw.github.com/lc-joenewby/dotfiles/master/dotfiles)"`

## Homebrew how to fix multi-account issues

1. Create a group brew and add accounts using homebrew to this group
2. brew doctor
3. sudo chgrp -R brew /usr/local/* (Change the group of homebrew installation directory)
4. sudo chmod -R g+w /usr/local/* (Allow group members to write inside this directory)
5. sudo chgrp -R brew /Library/Caches/Homebrew (Change the group of homebrew cache directory)
6. sudo chmod -R g+w /Library/Caches/Homebrew (Allow group members to write inside this directory)
7. sudo chgrp -R brew /opt (Change the group of the cask installation directory)
8. sudo chmod -R g+w /opt (Allow group members to write inside this directory)
9. brew doctor (check erros are gone)

## References

* [@alrra](https://github.com/alrra) (Cãtãlin Mariş)
  [https://github.com/alrra/dotfiles](https://github.com/alrra/dotfiles)
* [@mathiasbynens](https://github.com/mathiasbynens) (Mathias Bynens)
  [https://github.com/mathiasbynens/dotfiles](https://github.com/mathiasbynens/dotfiles)

## License
The code is available under the MIT license.
