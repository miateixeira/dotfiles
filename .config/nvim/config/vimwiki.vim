"""""""""""""""""""""""""""""""""""""""
" Vimwiki
"""""""""""""""""""""""""""""""""""""""

augroup vimwikigroup
  autocmd!
"  " automatically update links on read diary
"  autocmd BufRead,BufNewFile diary.md VimwikiDiaryGenerateLinks
  autocmd BufWritePost *.wiki silent :Vimwiki2HTML
  au BufNewFile,BufRead *.wiki setlocal formatoptions-=t
augroup end
