@echo on

if %HOME%=='' set %HOME%=%HOMEDRIVE%%HOMEPATH%
cd %HOME%\dotfiles

git submodule init && git submodule update

mklink /d %HOME%\.vim       dotfiles\.vim
mklink    %HOME%\.vimrc     dotfiles\.vimrc
mklink    %HOME%\.gvimrc    dotfiles\.gvimrc
mklink    %HOME%\.vimshrc   dotfiles\.vimshrc
mklink    %HOME%\.zshrc     dotfiles\.zshrc
mklink    %HOME%\.gitconfig dotfiles\.gitconfig
mklink    %HOME%\.gitignore dotfiles\.gitignore

pause

