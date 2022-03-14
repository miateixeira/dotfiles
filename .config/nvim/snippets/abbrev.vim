"""""""""""""""""""""""""""""""""""""""
" Snippets
"""""""""""""""""""""""""""""""""""""""
" TODO: use ultisnips or something similar here instead of vimscript

iabbrev @@ gteixe7@gmail.com
iabbrev www https://gteixe.github.io

" helper function for omitting space from non-key end of iabbrev
func Eatchar(pat)
  let c = nr2char(getchar(0))
  return (c =~ a:pat) ? '' : c
endfunc

augroup filetype_html
  autocmd!
  " auto-indent when reading/writing an HTML file
  autocmd BufWritePre,BufRead *.html :normal gg=G
  " turn off line wrapping when working on HTML file
  autocmd BufNewFile,BufRead *.html setlocal nowrap
augroup END

"""""""""""""""""""""""""""""""""""""""

augroup filetype_python
  autocmd!
  " comment out a line in Python files only
  autocmd FileType python nnremap <buffer> <localleader>c I#<esc>
  " 'iff' snippet for Python
  autocmd FileType python :iabbrev <buffer> iff if:<left>
augroup END

"""""""""""""""""""""""""""""""""""""""

augroup filetype_haskell
  autocmd!
  " 'case' snippet for Haskell
  autocmd FileType haskell :iabbrev <buffer> case case () of<Left><Left><Left><Left><C-R>=Eatchar('\s')<CR>
augroup END

"""""""""""""""""""""""""""""""""""""""

augroup filetype_tex
  autocmd!
  " comment out a line in .tex files only
  autocmd FileType tex nnremap <buffer> <localleader>c I%<esc>
  " \usepackage{} snippet for LaTeX
  autocmd FileType tex :iabbrev <buffer> usep \usepackage{}<Left><C-R>=Eatchar('\s')<CR>
augroup END
