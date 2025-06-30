# dotfiles
 > In Unix and Unix-like environments, any file or folder that starts with a dot character.
 > A convention arose of using dotfiles in the user's home directory to store per-user config.

\[[wikipedia](https://en.wikipedia.org/wiki/Hidden_file_and_hidden_directory#Unix_and_Unix-like_environments)\]

# Installation
1. Install [Homebrew](https://brew.sh/)
1. Run `sh install.sh`

# Tested on
| macOS   | Version |
| ------- | ------- |
| Sequoia | 15.2    |

# iTerm2
[Preferences > Load preferences from a custom folder or URL](https://iterm2.com/documentation-preferences-general.html)

# SpeedCrunch
https://heldercorreia.bitbucket.io/speedcrunch/advanced/colorschemeformat.html

# Troubleshooting

### permission denied: \~/.zsh/foo.zsh

Git only tracks the "permission bits" of files as a special mode internally, which can be managed via [git-add](https://git-scm.com/docs/git-add#Documentation/git-add.txt---chmod-x) or [git-update-index](https://git-scm.com/docs/git-update-index#Documentation/git-update-index.txt---chmod-x).

```bash
git add --chmod=+x path/to/file
```

This needs to be handled natively for directories, where the permission isn't captured.
```bash
$ ls -dal .zsh
drw-r--r--

$ chmod u+x ~/.zsh
```

# References
* The best way to store your dotfiles: A bare Git repository: https://www.atlassian.com/git/tutorials/dotfiles
* Your unofficial guide to dotfiles on GitHub: https://dotfiles.github.io/inspiration/
* https://github.com/geerlingguy/ansible-role-dotfiles
* iTerm2 keymaps for tmux: https://tangledhelix.com/blog/2012/04/28/iterm2-keymaps-for-tmux/
* https://github.com/tmux/tmux/wiki/FAQ#how-do-i-make-modified-function-and-arrow-keys-like-c-up-m-pageup-work-inside-tmux

# License
[MIT](https://github.com/johnnytran0/dotfiles/blob/main/LICENSE) © Johnny Tran
