"""""""""""""""""""""""""""""""""""""""
" NERDTree
"""""""""""""""""""""""""""""""""""""""

augroup NerdTree
  autocmd!
  " Start NERDTree and put the cursor back in the other window
  autocmd VimEnter * NERDTree | wincmd p
  " Exit Vim if NERDTree is the only window remaining in the only tab
  autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
  " autocmd BufRead,FileType nerdtree setlocal statusline="%{exists("b:NERDTreeRoot")?b:NERDTreeRoot.path.str():""}"
augroup END
