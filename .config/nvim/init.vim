" Install vim-plug if it is not already installed
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Source plugins
call plug#begin('~/.vim/plugged')
  source ~/.config/nvim/plugins.vim
call plug#end()

" Initialize sourcery
call sourcery#vim_dotfiles_path('config/')
" call sourcery#vim_dotfiles_path('colors/')
call sourcery#init()
