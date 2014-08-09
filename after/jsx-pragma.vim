"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vimscript file
"
" Check whether or not the @jsx pragma is correctly included in '%'.
" Set the result in b:jsx_pragma_found.
"
" Language: JSX (JavaScript)
" Maintainer: Max Wang <mxawng@gmail.com>
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Only check once.
if exists('b:jsx_pragma_found')
  finish
endif

" Get the current filepath.
let s:path = shellescape(expand('%:p'))

" Get the line numbers of the first non-whitespace character and the first
" line-initial doc-comment.
let s:lnum_text = system("grep -n -m1 '[^\\s]' ".s:path) + 0
let s:lnum_comment = system("grep -n -m1 '^/\\*\\*' ".s:path) + 0

" The @jsx pragma is required to be in a doc-comment before anything else, so
" if we find something else first, this ain't JSX.
if s:lnum_text < s:lnum_comment
  let b:jsx_pragma_found = 0
  finish
endif

" Now check if @jsx is actually found in that doc-comment.
let s:pattern = "'(?s)/\\*(?:.(?!\\*\\*/))*jsx.*?\\*/'"
call system('grep -Pz '.s:pattern.' '.s:path.' > /dev/null')

let b:jsx_pragma_found = !v:shell_error
