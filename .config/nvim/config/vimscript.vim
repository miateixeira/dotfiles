"""""""""""""""""""""""""""""""""""""""
" Vimscript Helpers
"""""""""""""""""""""""""""""""""""""""

function! HighlightSearch()
  if &hls
    return 'H'
  else
    return ''
  endif
endfunction


