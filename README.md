
## Dev Environment Utilities

### Wezterm
Terminal
https://wezterm.org/index.html

### Zsh
Shell
Uses powerlevel10k theme
https://github.com/romkatv/powerlevel10k

### MacPorts
Mac package manager. For use to install utilities and non dev related software.
https://www.macports.org/

### Silver Searcher
Better grep utility
https://github.com/ggreer/the_silver_searcher

### lazygit
Git utility
https://github.com/jesseduffield/lazygit


## Setup

Clone down the repo to your home directory
```
cd ~
git clone git@github.com:FourSeventy/dotfiles.git ~
```


# Wezterm
Install binary from website https://wezterm.org/installation.html
Symlink config dotfile
```
cd ~
ln -s .dotfiles/.wezterm.lua ~/.wezterm.lua
```

# Zsh
Symlink config dotfiles
```
cd ~
ln -s  .dotfiles/.zshrc ~/.zshrc
ln -s  .dotfiles/.zshrclocal ~/.zshrclocal
ln -s  .dotfiles/.p10k.zsh ~/.p10k.zsh
```

Install powerlevel10k theme
```
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
```

# Other
Symlink other conigs
```
cd ~
ln -s  .dotfiles/.curlrc ~/.curlrc
ln -s  .dotfiles/.gitconfig ~/.gitconfig
```




