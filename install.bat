@echo on

if %HOME%=='' set %HOME%=%HOMEDRIVE%%HOMEPATH%
cd %HOME%\dotfiles

git submodule init && git submodule update

mkdir _vim\backup _vim\swp

cd %HOME%
mklink /d .vim     dotfiles\_vim
mklink    .vimrc   dotfiles\_vimrc
mklink    .gvimrc  dotfiles\_gvimrc
mklink    .vimshrc dotfiles\_vimshrc

pause
