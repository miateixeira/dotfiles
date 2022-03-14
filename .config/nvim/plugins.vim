" let Vundle manage Vundle, required
Plug 'gmarik/Vundle.vim'

"""""""""""""""""""""""""""""""""""""""
" Installed Plugins
"""""""""""""""""""""""""""""""""""""""

" Filetype and syntax plugin for LaTeX files
Plug 'lervag/vimtex'

" Personal wiki
Plug 'vimwiki/vimwiki'

" Task management integration
Plug 'blindFS/vim-taskwarrior'

" Taskwarrior and vimwiki integration
Plug 'tools-life/taskwiki'

" Distraction-free writing
Plug 'junegunn/goyo.vim'

" Full path fuzzy finder
" Plug 'ctrlpvim/ctrlp.vim'

" File-type sensible comments
Plug 'tomtom/tcomment_vim'

" A collection of language packs
Plug 'sheerun/vim-polyglot'

" Plug for aligning text
Plug 'godlygeek/tabular'

" Calendar window inside vim
Plug 'mattn/calendar-vim'

" General-purpose command-line fuzzy finder
Plug 'junegunn/fzf.vim'

" Improved querying of tags; relies on fzf
Plug 'matt-snider/vim-tagquery'

" Handling of unicode and digraph characters
Plug 'chrisbra/unicode.vim'

" Provides a start screen
Plug 'mhinz/vim-startify'

" File explorer
Plug 'preservim/nerdtree'

" Vim Sourcery
Plug 'jesseleite/vim-sourcery'

"""""""""""""""""""""""""""""""""""""""
" Plugin Configs
"""""""""""""""""""""""""""""""""""""""

" Config: sourcery

let g:sourcery#annotation_types = [
  \ 'Mappings',
  \ 'Config',
  \ 'Highlights',
  \ ]

" Config: vimtex

let g:tex_flavor = 'pdflatex'
let g:vimtex_view_general_viewer = 'zathura'

" Config: vimwiki

let g:vimwiki_list = [{'path': '~/vimwiki/',
                      \ 'syntax': 'default', 'ext': '.wiki',
                      \ 'auto_diary_index': 1,
                      \ 'auto_tags':1,
                      \ 'template_path': '~/vimwiki/templates',
                      \ 'template_default': 'default',
                      \ 'template_ext': '.html'}]
let g:vimwiki_use_calendar = 1

" Config: vim-tagquery

let g:tagquery_ctags_file = '~/vimwiki/.vimwiki_tags'

" Config: calendar-vim

let g:calendar_navi = 'both'            " navigation buttons at top
let g:calendar_monday = 1               " start week on monday
let g:calendar_datetime = ''
let g:calendar_number_of_months = 5     " number of months to show
let g:calendar_options = "nonu nornu "

" Config: goyo

let g:goyo_linenr = 1                   " show line numbers in Goyo

" Config: startify

let g:startify_lists = [
         \ { 'type': 'bookmarks', 'header': ['  Bookmarks']},
         \ { 'type': 'files',     'header': ['  MRU']      }
         \ ]

let g:startify_bookmarks = [
      \ '~/vimwiki/index.wiki',
      \ '~/phd/ta/ling185/w22/grading185a-w22/',
      \ '~/.config/nvim/init.vim',
      \ '~/.config/nvim/plugins.vim'
      \ ]

" Config: nerdtree

let g:NERDTreeWinPos = "right"
let g:NERDTreeStatusline = '%#NonText#'
let NERDTreeShowHidden=1
