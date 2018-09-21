set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Add all your plugins here (note older versions of Vundle used Bundle instead of Plugin)
"Plugin 'tmhedberg/SimpylFold'
"Bundle 'Valloric/YouCompleteMe'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'bling/vim-airline'
Plugin 'lervag/vimtex'
Plugin 'dylanaraps/wal.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required


let mapleader = " "

"if (has("termguicolors"))
"  set termguicolors
"endif

"! Using plug
"Plug 'dylanaraps/wal.vim'

"syntax enable " enbale syntax processing
"set background = dark
"let g:solarized_visibility = "high"
"let g:solarized_contrast = "high"
"let g:solarized_termcolors = 16
"colorscheme solarized

"set statusline=%f\ %=col:%2c\ line:%2l
set statusline=
set statusline+=%7*\[%n]                                  "buffernr
set statusline+=%1*\ %<%F\                                "File+path
set statusline+=%2*\ %y\                                  "FileType
set statusline+=%3*\ %{''.(&fenc!=''?&fenc:&enc).''}      "Encoding
set statusline+=%3*\ %{(&bomb?\",BOM\":\"\")}\            "Encoding2
set statusline+=%4*\ %{&ff}\                              "FileFormat (dos/unix..) 
set statusline+=%5*\ %{&spelllang}\%{HighlightSearch()}\  "Spellanguage & Highlight on?
set statusline+=%8*\ %=\ row:%l/%L\ (%03p%%)\             "Rownumber/total (%)
set statusline+=%9*\ col:%03c\                            "Colnr
set statusline+=%0*\ \ %m%r%w\ %P\ \                      "Modified? Readonly? Top/bot.

function! HighlightSearch()
  if &hls
    return 'H'
  else
    return ''
  endif
endfunction

set backspace=2 " make backspace work like most other apps
set noswapfile  " don't swap buffer to file
set ruler       " show the cursor position all the time
set showcmd     " display incomplete commands
set incsearch   " do incremental searching
set laststatus=2 " always display the status line
set history=500 " sets how many lines of history VIM has to remember
set wildmenu    " visual autocomplete for command menu
set autowrite   " save file before switching a buffer
set autoindent
set showmatch

set number
set numberwidth=4
set relativenumber

set textwidth=500
set colorcolumn=+1
set formatoptions+=w

set tabstop=2 " tab size
set shiftwidth=2 " indent size
set shiftround
set softtabstop=2 " simulated tab width
set expandtab " spaces on tab press
set smartindent " indent automatically

cabbrev h vert to h
"filetype indent on " load filetype-specific indent files
map <C-E> <C-W>
" move line down
noremap <leader>- dd p
" move line up
noremap <leader>_ dd kkkp

""""" NORMAL MODE " convert current word to uppercase
nnoremap <leader><c-u> viwU

""""" INSERT MODE
"delete current line
inoremap <leader><c-d> <esc>ddi
" convert current word to uppercase
inoremap <leader><c-u> <esc>viwUi


" open .vimrc in vsplit
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
" source .vimrc after editing
nnoremap <leader>sv :source $MYVIMRC<cr>

iabbrev @@ gteixe@mit.edu

syntax on
filetype plugin indent on
set splitbelow
set splitright

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

let g:tex_flavor = 'latex'
let g:SimpylFold_docstring_preview=1
let g:ycm_autoclose_preview_window_after_completion=1
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree
"au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" NERDTrees File highlighting
"function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
"  exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
"  exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
"endfunction
"
"call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
"call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
"call NERDTreeHighlightFile('config', 'green', 'none', 'green', '#151515')
"call NERDTreeHighlightFile('html', 'cyan', 'none', 'cyan', '#151515')
"call NERDTreeHighlightFile('py', 'Magenta', 'none', '#ff00ff', '#151515')

let g:nerdtree_tabs_open_on_console_startup=1
let g:nerdtree_tabs_autoclose=1
let g:NERDTreeWinPos = "right"
let g:nerdtree_tabs_autofind=1

"Jump to guide
inoremap <Space><Space> <Esc>/<++><Enter>"_c4l

"LaTeX remappings
autocmd FileType tex inoremap ;1 \section{}<Esc>i
autocmd FileType tex inoremap ;2 \subsection{}<Esc>i
autocmd FileType tex inoremap ;3 \subsubsection{}<Esc>i
autocmd FileType tex inoremap ;4 \subsubsubsection{}<Esc>i

autocmd FileType tex inoremap \tc \begin{table}[]\begin{center}<Enter>\begin{tabular}{<++>}\hline<Enter><Tab><++><Space>\\<Enter>\hline\end{tabular}<Enter>\caption{<++>}<Enter>\label{<++>}<Enter>\end<center>\end{table}<Esc>kkkkkk0/[<Enter>a
