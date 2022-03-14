"""""""""""""""""""""""""""""""""""""""
" Statusline
"""""""""""""""""""""""""""""""""""""""

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
