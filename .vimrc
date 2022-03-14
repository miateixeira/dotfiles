set nocompatible              " required
filetype off                  " required
set nofoldenable

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Add all your plugins here (note older versions of Vundle used Bundle instead of Plugin)
"Plugin 'bling/vim-airline'
"Plugin 'itchyny/lightline.vim'
Plugin 'lervag/vimtex'
Plugin 'dylanaraps/wal.vim'
Plugin 'junegunn/goyo.vim'
Plugin 'vimwiki/vimwiki'
Plugin 'tools-life/taskwiki'
Plugin 'blindFS/vim-taskwarrior'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tomtom/tcomment_vim'
Plugin 'sheerun/vim-polyglot'
Plugin 'godlygeek/tabular'
"Plugin 'itchyny/calendar.vim'
Plugin 'mattn/calendar-vim'
"Plugin 'preservim/tagbar'
Plugin 'junegunn/fzf.vim'
Plugin 'matt-snider/vim-tagquery'
" Plugin 'SirVer/ultisnips'
Plugin 'chrisbra/unicode.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

"let g:lightline = {
"      \ 'colorscheme' : 'seoul256',
"      \ }

function! HighlightSearch()
  if &hls
    return 'H'
  else
    return ''
  endif
endfunction

set backspace=indent,eol,start " make backspace work like most other apps
set noswapfile                 " don't swap buffer to file
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

set textwidth=100
set formatoptions+=w

set tabstop=2     " tab size
set shiftwidth=2  " indent size
set shiftround
set softtabstop=2 " simulated tab width
set expandtab     " spaces on tab press
set smartindent   " indent automatically
set smartcase
set ignorecase
" set colorcolumn=80

set background=dark

set backupdir=~/.vim/tmp/ " for the backup files
set directory=~/.vim/tmp/ " for the swap files

" remap escape key to jj
inoremap jj <ESC>:w<CR>
" enter empty line below
map <CR> o<Esc>k

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

iabbrev @@ gteixe7@gmail.com

syntax on
set splitbelow
set splitright

"split navigations
noremap <leader>- dd p
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

let g:tex_flavor = 'pdflatex'
let g:vimtex_view_general_viewer = 'zathura'

" VimWiki
let g:vimwiki_list = [{'path': '~/vimwiki/',
                      \ 'syntax': 'default', 'ext': '.wiki',
                      \ 'auto_diary_index': 1,
                      \ 'auto_tags':1,
                      \ 'template_path': '~/vimwiki/templates',
                      \ 'template_default': 'default',
                      \ 'template_ext': '.html'}]
let g:vimwiki_use_calendar = 1
" Convert markdown links to vimwiki syntax
nnoremap <Leader>tw $bdi(0pa\|<Esc>0i[<Esc>$a<BS><BS>]<Esc>
" Convert markdown header to vimwiki syntax
nnoremap <Leader>h 0xi=<Esc>A<Space>=<Esc>0
" Convert markdown subheader to vimwiki syntax
nnoremap <Leader>hh 0xxi==<Esc>A<Space>==<Esc>0
" Convert markdown subsubheader to vimwiki syntax
nnoremap <Leader>hhh 0xxxi===<Esc>A<Space>===<Esc>0
"command! Diary VimwikiDiaryIndex
"augroup vimwikigroup
"  autocmd!
"  " automatically update links on read diary
"  autocmd BufRead,BufNewFile diary.md VimwikiDiaryGenerateLinks
"augroup end
nnoremap <Leader>w<Leader>d :VimwikiDiaryIndex<CR>
nnoremap <Leader>sw :VimwikiSearch
nnoremap <Leader>st :VimwikiSearchTags
nnoremap <Leader>toc :VimwikiTOC<CR>
nnoremap <Leader>wt :VimwikiTable

autocmd BufWritePost *.wiki silent :Vimwiki2HTML

let g:tagquery_ctags_file = '~/vimwiki/.vimwiki_tags'
" let g:tagbar_type_vimwiki = {
"           \   'ctagstype':'markdown'
"           \ , 'kinds':['h:header']
"           \ , 'sro':'&&&'
"           \ , 'kind2scope':{'h':'header'}
"           \ , 'sort':0
"           \ , 'ctagsbin':'/home/mia/scripts/markdown2ctags.py'
"           \ , 'ctagsargs':'default'
"           \ }

" Calendar
let g:calendar_navi = 'both'             " navigation buttons at top
let g:calendar_monday = 1               " start week on monday
let g:calendar_datetime = ''
let g:calendar_number_of_months = 5     " number of months to show
let g:calendar_options = "nonu nornu "
nnoremap <Leader>c :CalendarVR<CR>

hi link CalNavi     Type
hi link CalSaturday Comment
hi link CalSunday   Comment
hi link CalRuler    Search
hi link CalWeeknm   Comment
hi link CalToday    Statement
hi link CalHeader   Directory
hi link CalMemo     Type
hi link CalNormal   Normal

let g:goyo_linenr = 1 "show line numbers in Goyo

set noshowmode "hide -- INSERT -- (redundant bc lightline)

"autocmd BufWritePost $HOME/vimwiki/phd/articles/* !$HOME/scripts/compile_notes.sh <afile>
noremap <silent> <Leader>z :!$HOME/scripts/compile_notes.sh<Space> %<CR><CR>:exe ":echo 'compiled to pdf using pandoc'"<CR>

" reload .vimrc -- making all changes active
map <silent> <Leader>v :source ~/.vimrc<CR>:PluginInstall<CR>:bdelete<CR>:exe ":echo 'vimrc reloaded'"<CR>

""""""""""""""""""""""""""""
" netrw                        
""""""""""""""""""""""""""""
let g:netrw_winsize = 25      " absolute width of netrw window
let g:netrw_liststyle = 3     " tree-view
let g:netrw_banner = 0        " remove netrw banner
let g:netrw_browse_split = 0  " open file in the same window
let g:netrw_altv = 1
" Leader E will open netrw
noremap <silent> <Leader>e :Explore<CR>

""""""""""""""""""""""""""""
" tcomment
""""""""""""""""""""""""""""
" Leader C is the prefix for code related mappings
noremap <silent> <Leader>cc :TComment<CR>

""""""""""""""""""""""""""""
" tabular
" Leader T is prefix for tabular related mappings
""""""""""""""""""""""""""""
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

""""""""""""""""""""""""""""
" CtrlP
""""""""""""""""""""""""""""
" Leader F is for file related mappings (open, browse...)
nnoremap <silent> <Leader>f :CtrlP<CR>            " find file
nnoremap <silent> <Leader>fm :CtrlPMRU<CR>        " find Most Recently Used (MRU) file
" Leader B for buffer related mappings
nnoremap <silent> <Leader>b :CtrlPBuffer<CR>      " cycle between buffers
nnoremap <silent> <Leader>bb :bn<CR>              " create (N)ew buffer
nnoremap <silent> <Leader>bd :bdelete<CR>         " (D)elete the current buffer
nnoremap <silent> <Leader>bu :bunload<CR>         " (U)nload the current buffer
nnoremap <silent> <Leader>bl :setnomodifiable<CR> " (L)ock the current buffer


set laststatus=2
set statusline=
set statusline+=%9*[%n]
set statusline+=%1*\ %{StatuslineMode()}\ 
set statusline+=%2*\ <<\ %t\ >>\ 
set statusline+=%3*\ %{strlen(&fenc)?&fenc:'none'}\ 
set statusline+=%4*%=%m%h%r\ 
set statusline+=%5*%{b:gitbranch}
set statusline+=%6*\ %F\ 
set statusline+=%7*\ %l/%L:%c\ 
set statusline+=%8*\ %y\ 

" hi User9 ctermbg=black       ctermfg=darkgrey
" hi User1 ctermbg=red         ctermfg=darkgrey
" hi User2 ctermbg=green       ctermfg=darkgrey
" hi User3 ctermbg=yellow      ctermfg=darkgrey
" hi User4 ctermbg=blue        ctermfg=darkgrey
" hi User5 ctermbg=magenta     ctermfg=darkgrey
" hi User6 ctermbg=darkmagenta ctermfg=darkgrey
" hi User7 ctermbg=cyan        ctermfg=darkgrey
" hi User8 ctermbg=white       ctermfg=darkgrey

hi User9 ctermbg=yellow ctermfg=darkblue
hi User1 ctermbg=darkgreen ctermfg=lightcyan
hi User2 ctermbg=green ctermfg=darkblue
hi User3 ctermbg=darkcyan ctermfg=lightcyan
hi User4 ctermbg=cyan ctermfg=darkblue
hi User5 ctermbg=white ctermfg=darkblue
hi User6 ctermbg=lightgray ctermfg=darkblue
hi User7 ctermbg=magenta ctermfg=lightmagenta
hi User8 ctermbg=darkmagenta ctermfg=lightmagenta


hi VertSplit ctermbg=NONE ctermfg=white
hi LineNr    ctermbg=NONE ctermfg=black

function! StatuslineMode()
  let l:mode=mode()
  if l:mode==#"n"
    return "NORMAL"
  elseif l:mode==?"v"
    return "VISUAL"
  elseif l:mode==#"i"
    return "INSERT"
  elseif l:mode==#"R"
    return "REPLACE"
  elseif l:mode==?"s"
    return "SELECT"
  elseif l:mode==#"t"
    return "TERMINAL"
  elseif l:mode==#"c"
    return "COMMAND"
  elseif l:mode==#"!"
    return "SHELL"
  endif
endfunction

function! StatuslineGitBranch()
  let b:gitbranch=""
  if &modifiable
    try
      let l:dir=expand('%:p:h')
      let l:gitrevparse = system("git -C ".l:dir." rev-parse --abbrev-ref HEAD")
      if !v:shell_error
        let b:gitbranch=" (".substitute(l:gitrevparse, '\n', '', 'g').") "
      endif
    catch
    endtry
  endif
endfunction

augroup GetGitBranch
  autocmd!
  autocmd VimEnter,WinEnter,BufEnter * call StatuslineGitBranch()
augroup END

augroup vimwikigroup
  au!
  au BufNewFile,BufRead *.wiki setlocal formatoptions-=t
augroup END
