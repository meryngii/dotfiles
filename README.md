dotfiles
========

Installation
-----

Set up Git.

Run the commands below on the terminal (UNIX):

    git clone https://github.com/meryngii/dotfiles.git
    cd dotfiles && git submodule init && git submodule update
    mkdir .vim/{backup,swp}
    cd ~ && ln -s dotfiles/{.vim,.vimrc,.gvimrc,.vimshrc} .

(Windows) (Required to start cmd.exe as a administrator):

    git clone https://github.com/meryngii/dotfiles.git
    cd dotfiles && git submodule init && git submodule update
    mkdir .vim\backup && mkdir .vim\swp
    cd ..\ && mklink /d .vim dotfiles\.vim && mklink .vimrc dotfiles\.vimrc && mklink .gvimrc dotfiles\.gvimrc && mklink .vimshrc dotfiles\.vimshrc

Run GVIM and type `:NeoBundleInstall`

Install vimproc (see also https://github.com/Shougo/vimproc) (UNIX) :

    cd dotfiles/.vim/bundle/vimproc
    make -f make_unix.mak

Install 'Ricty' font.

