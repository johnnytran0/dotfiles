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


# References

* https://www.atlassian.com/git/tutorials/dotfiles

# License

MIT