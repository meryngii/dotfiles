@echo on

if %HOME%=='' set %HOME%=%HOMEDRIVE%%HOMEPATH%
cd %HOME%\dotfiles

git submodule init && git submodule update

rmdir %HOME%\.vim
del /P %HOME%\.vim
del /p %HOME%\.vimrc
del /p %HOME%\.gvimrc
del /p %HOME%\.vimshrc
del /p %HOME%\.bashrc
del /p %HOME%\.zshrc
del /p %HOME%\.gitconfig
del /p %HOME%\.gitignore
del /p %HOME%\.minttyrc
del /p %HOME%\.oh-my-zsh

mklink /d %HOME%\.vim       dotfiles\.vim
mklink    %HOME%\.vimrc     dotfiles\.vimrc
mklink    %HOME%\.gvimrc    dotfiles\.gvimrc
mklink    %HOME%\.vimshrc   dotfiles\.vimshrc
mklink    %HOME%\.zshrc     dotfiles\.zshrc
mklink    %HOME%\.gitconfig dotfiles\.gitconfig
mklink    %HOME%\.gitignore dotfiles\.gitignore
mklink    %HOME%\.minttyrc  dotfiles\.minttyrc
mklink    %HOME%\.oh-my-zsh dotfiles\.oh-my-zsh

pause

