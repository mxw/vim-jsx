"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim ftplugin file
"
" Language: JSX (JavaScript)
" Maintainer: Max Wang <mxawng@gmail.com>
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


" modified from html.vim
if exists("loaded_matchit") && !exists('b:jsx_match_words')
  let b:match_ignorecase = 0
  let b:jsx_match_words = '(:),\[:\],{:},<:>,' .
        \ '<\@<=\([^/][^ \t>]*\)[^>]*\%(/\@<!>\|$\):<\@<=/\1>'
  let b:match_words = exists('b:match_words')
    \ ? b:match_words . ',' . b:jsx_match_words
    \ : b:jsx_match_words
endif

setlocal suffixesadd+=.jsx
