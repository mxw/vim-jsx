"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim syntax file
"
" Language: JSX (JavaScript)
" Maintainer: Max Wang <mxawng@gmail.com>
" Depends: pangloss/vim-javascript
"
" CREDITS: Inspired by Facebook.
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Prologue; load in XML syntax.
if exists('b:current_syntax')
  let s:current_syntax=b:current_syntax
  unlet b:current_syntax
endif
syn include @XMLSyntax syntax/xml.vim
if exists('s:current_syntax')
  let b:current_syntax=s:current_syntax
endif

" Highlight JSX regions as XML; recursively match.
syn region jsxRegion contains=@XMLSyntax,jsxRegion,jsBlock,javascriptBlock
  \ start=+<\@<!<\z([a-zA-Z][a-zA-Z0-9:\-.]*\)+
  \ skip=+<!--\_.\{-}-->+
  \ end=+</\z1\_\s\{-}>+
  \ end=+/>+
  \ keepend
  \ extend

" JSX attributes should color as JS.  Note the trivial end pattern; we let
" jsBlock take care of ending the region.
syn region xmlString contained start=+{+ end=++ contains=jsBlock,javascriptBlock

" Add jsxRegion to the lowest-level JS syntax cluster.
syn cluster jsExpression add=jsxRegion

" Allow jsxRegion to contain reserved words.
" See: https://github.com/othree/yajs.vim
syn cluster javascriptNoReserved add=jsxRegion
