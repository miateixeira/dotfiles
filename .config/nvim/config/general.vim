"""""""""""""""""""""""""""""""""""""""
" General settings
"""""""""""""""""""""""""""""""""""""""

syntax on
set noswapfile                 " don't swap buffer to file
set backspace=indent,eol,start " make backspace work like most other apps
set ruler                      " show the cursor position all the time
set showcmd                    " display incomplete commands
set incsearch                  " do incremental searching
set history=500                " sets how many lines of history VIM has to remember
set wildmenu                   " visual autocomplete for command menu
set autowrite                  " save file before switching a buffer
set autoindent
set showmatch
set number
set numberwidth=4
set relativenumber
set wrap
set formatoptions+=w
set tabstop=2     " tab size
set shiftwidth=2  " indent size
set shiftround
set softtabstop=2 " simulated tab width
set expandtab     " spaces on tab press
set smartindent   " indent automatically
set smartcase
set ignorecase
set backupdir=~/.vim/tmp/ " for the backup files
set directory=~/.vim/tmp/ " for the swap files
set splitbelow
set splitright
set noshowmode "hide -- INSERT -- (redundant bc lightline)
set fillchars+=vert:\ 
