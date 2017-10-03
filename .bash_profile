#.bash_profile is executed for login shells, while .bashrc is executed for interactive non-login shells.
# An exception to the terminal window guidelines is Mac OS X’s Terminal.app, which runs a login shell by default for each new terminal window, calling .bash_profile instead of .bashrc.
if [ -f ~/.bashrc ]; then
   source ~/.bashrc
fi
