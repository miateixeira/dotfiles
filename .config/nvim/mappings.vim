"""""""""""""""""""""""""""""""""""""""
" Mappings
"""""""""""""""""""""""""""""""""""""""
" TODO: organize this file by plugin/use

let mapleader = "\\"
let maplocalleader = "_"

" visually select the current word
nnoremap <space> viw
" wrap the current word in double quotes
nnoremap <leader>" viw<esc>a"<esc>bi"<esc>lel
" wrap the current word in double quotes
nnoremap <leader>' viw<esc>a'<esc>bi'<esc>lel
" wrap the visually selected text in double quotes
vnoremap <leader>" <esc>a"<esc>`<i"<esc>ll
" wrap the visually selected text in single quotes
vnoremap <leader>' <esc>a'<esc>`<i'<esc>ll

" go to beginning of current line
nnoremap H 0
" go to end of current line
nnoremap L $

" remap escape key to jj
inoremap jj <esc>
" enter empty line below
noremap <CR> o<Esc>k

noremap <C-E> <C-W>

" delete line
nnoremap -d dd
" clear the line
nnoremap -c ddO

" move line down
nnoremap - ddp
" move line up
nnoremap _ ddkkp

" convert current word to uppercase in insert mode
inoremap <c-u> <esc>viwUea
" convert current word to uppercase in normal mode
nnoremap <c-u> viwU
" delete current line
inoremap <c-d> <esc>ddi

" open .vimrc in vsplit
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
" source .vimrc after editing
nnoremap <leader>sv :source $MYVIMRC<cr>

"split navigations
noremap <leader>- dd p
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Convert markdown links to vimwiki syntax
nnoremap <Leader>tw $bdi(0pa\|<Esc>0i[<Esc>$a<BS><BS>]<Esc>
" Convert markdown header to vimwiki syntax
nnoremap <Leader>h 0xi=<Esc>A<Space>=<Esc>0
" Convert markdown subheader to vimwiki syntax
nnoremap <Leader>hh 0xxi==<Esc>A<Space>==<Esc>0
" Convert markdown subsubheader to vimwiki syntax
nnoremap <Leader>hhh 0xxxi===<Esc>A<Space>===<Esc>0

nnoremap <Leader>w<Leader>d :VimwikiDiaryIndex<CR>
nnoremap <Leader>sw :VimwikiSearch
nnoremap <Leader>st :VimwikiSearchTags
nnoremap <Leader>toc :VimwikiTOC<CR>
nnoremap <Leader>wt :VimwikiTable


nnoremap <Leader>c :CalendarVR<CR>

noremap <silent> <Leader>z :!$HOME/scripts/compile_notes.sh<Space> %<CR><CR>:exe ":echo 'compiled to pdf using pandoc'"<CR>

" reload .vimrc -- making all changes active
map <silent> <Leader>v :source $MYVIMRC<CR>:PlugInstall<CR>:bdelete<CR>:exe ":echo 'vimrc reloaded'"<CR>

" Leader C is the prefix for code related mappings
noremap <silent> <Leader>cc :TComment<CR>

" tabularize selection on =
vnoremap <silent> <Leader>te        :Tabularize /=<CR>
" tabularize selection on &
vnoremap <silent> <Leader>ta        :Tabularize /&<CR>
" tabularize selection on Space
vnoremap <silent> <Leader>t<Space>  :Tabularize /\ <CR>
" tabularize selection on #
vnoremap <silent> <Leader>tp  :Tabularize /#<CR>
" tabularize on pattern you enter
vnoremap <silent> <Leader>t         :Tabularize /

" Leader F is for file related mappings (open, browse...)
nnoremap <silent> <Leader>f :CtrlP<CR>            " find file
nnoremap <silent> <Leader>fm :CtrlPMRU<CR>        " find Most Recently Used (MRU) file
" Leader B for buffer related mappings
nnoremap <silent> <Leader>b :CtrlPBuffer<CR>      " cycle between buffers
nnoremap <silent> <Leader>bb :bn<CR>              " create (N)ew buffer
nnoremap <silent> <Leader>bd :bdelete<CR>         " (D)elete the current buffer
nnoremap <silent> <Leader>bu :bunload<CR>         " (U)nload the current buffer
nnoremap <silent> <Leader>bl :setnomodifiable<CR> " (L)ock the current buffer


