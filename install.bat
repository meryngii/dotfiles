
git submodule init && git submodule update

mkdir .vim\backup .vim\swp

mklink /d %HOMEDRIVE%.vim .vim
mklink .vimrc .vimrc
mklink .gvimrc .gvimrc
mklink .vimshrc .vimshrc
