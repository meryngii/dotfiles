dotfiles
========

Usage
-----
1. `git clone git@github.com:meryngii/dotfiles.git`
2. `cd dotfiles && git submodule init && git submodule update`
3. `mkdir .vim/{backup,swp}`
4. `cd ~ && ln -s dotfiles/{.vim,.vimrc,.gvimrc,.vimshrc} .`
5. Run GVIM and `:NeoBundleInstall`
6. Setup vimproc https://github.com/Shougo/vimshell

for Windows (run as Administrator)
`mklink /d .vim dotfiles\.vim && mklink .vimrc dotfiles\.vimrc && mklink .gvimrc dotfiles\.gvimrc && mklink .vimshrc dotfiles\.vimshrc`

