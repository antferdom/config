# Dotfiles management using git bare repository
```bash
git init --bare $HOME/.myconf
alias config='/usr/bin/git --git-dir=$HOME/.myconf/ --work-tree=$HOME'
config config status.showUntrackedFiles no
```

# References
- [Ask HN: What do you use to manage dotfiles?](https://news.ycombinator.com/item?id=11071754)
