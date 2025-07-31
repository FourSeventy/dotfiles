
## Dev Environment Utilities

### Wezterm
Terminal
https://wezterm.org/index.html
Config found in .wezterm.lua

### Zsh
Shell.
Config found in .zshrc

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
```


ln -s .dotfiles/.bash_profile ~/.bash_profile


ln -s  .dotfiles/.curlrc ~/.curlrc

ln -s  .dotfiles/.gitconfig ~/.gitconfig

