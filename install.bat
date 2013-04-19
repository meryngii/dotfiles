
if %HOME%=='' set %HOME%=%HOMEDRIVE%%HOMEPATH%

git submodule init && git submodule update

mkdir .vim\backup .vim\swp

mklink /d %HOME%\.vim     _vim
mklink    %HOME%\.vimrc   _vimrc
mklink    %HOME%\.gvimrc  _gvimrc
mklink    %HOME%\.vimshrc _vimshrc
