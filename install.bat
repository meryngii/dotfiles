@echo on

if %HOME%=='' set %HOME%=%HOMEDRIVE%%HOMEPATH%
cd %HOME%\dotfiles

git submodule init && git submodule update

mkdir _vim\backup _vim\swp

mklink /d %HOME%\.vim       dotfiles\_vim
mklink    %HOME%\.vimrc     dotfiles\_vimrc
mklink    %HOME%\.gvimrc    dotfiles\_gvimrc
mklink    %HOME%\.vimshrc   dotfiles\_vimshrc
mklink    %HOME%\.zshrc     dotfiles\_zshrc
mklink    %HOME%\.gitconfig dotfiles\_gitconfig

pause

