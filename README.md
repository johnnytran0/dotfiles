# dotfiles
 > In Unix and Unix-like environments, any file or folder that starts with a dot character.

 > A convention arose of using dotfiles in the user's home directory to store per-user config.

\[[wikipedia](https://en.wikipedia.org/wiki/Hidden_file_and_hidden_directory#Unix_and_Unix-like_environments)\]

# Tested on
| macOS | Version |
| -| - |
| Monterey | 12.1 |

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
# Monokai/Molokai hex colors. 
# http://www.colourlovers.com/lover/Monokai/colors 
#   cyan - #00b9d7
#   gold/brown - #abaa98
#   green - #82cdb9
#   off-white #f5f5f5
#   orange - #f37259
#   pink  - #ff3d70
#   pink/magenta - #f7208b
#   yellow - #f9f5c2


```bash
for i in {0..255}; do
    printf "\x1b[38;5;${i}mcolour${i}\x1b[0m\n"
done
```

# References

* https://www.atlassian.com/git/tutorials/dotfiles

# License

[MIT](https://github.com/johnnytr-n/dotfiles/blob/main/LICENSE) © Johnny Tran