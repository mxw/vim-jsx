"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim indent file
"
" Language: JSX (JavaScript)
" Maintainer: Max Wang <mxawng@gmail.com>
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Prologue; load in XML indentation.
if exists('b:did_indent')
  let s:did_indent=b:did_indent
  unlet b:did_indent
endif
exe 'runtime! indent/xml.vim'
if exists('s:did_indent')
  let b:did_indent=s:did_indent
endif

setlocal indentexpr=GetJsxIndent()

" JS indentkeys
setlocal indentkeys=0{,0},0),0],0\,,!^F,o,O,e
" XML indentkeys
setlocal indentkeys+=*<Return>,<>>,<<>,/,{,}

" Cleverly mix JS and XML indentation.
fu! GetJsxIndent()
  let ind = GetJavascriptIndent()

  " Get all syntax items for the end of the previous line.
  let lnum = prevnonblank(v:lnum - 1)
  let col = strlen(getline(lnum)) - 1
  let prevsyn = map(synstack(lnum, col), 'synIDattr(v:val, "name")')

  " Keep only the JSX and XML items.
  let jsxsyn = filter(prevsyn, 'v:val =~ "xml" || v:val =~ "jsx"')

  " If the previous line ended with XML, assume we are still in JSX and use
  " XML indenting; otherwise, stick with the existing JS indentation.  This
  " ensures that hitting an indentkey after the following:
  "
  "   foo =
  "     <my:element
  "
  " does not reset the indentation of the second line to match the first.
  if !empty(jsxsyn)
    let ind = max([ind, XmlIndentGet(v:lnum, 0)])

    " Align '/>' with '<' for multiline self-closing tags.
    if getline(v:lnum) =~? '^\s*\/>\s*;\='
      let ind = ind - &sw
    endif
  endif

  return ind
endfu
