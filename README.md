vim-jsx
=======

Syntax highlighting and indenting for JSX.  JSX is a JavaScript syntax
transformer which translates inline XML document fragments into JavaScript
objects.  It was developed by Facebook alongside [React][1].

This bundle requires pangloss's [vim-javascript][2] syntax highlighting.

Vim support for inline XML in JS is remarkably similar to the same for PHP,
which you can find [here][3].

Usage
-----

By default, JSX syntax highlighting and indenting will be enabled only for
files with the `.jsx` extension.  If you would like JSX in `.js` files, add

    let g:jsx_ext_required = 0

to your .vimrc or somewhere in your include path.  If you wish to restrict JSX
to files with the pre-v0.12 `@jsx React.DOM` pragma, add

    let g:jsx_pragma_required = 1

to your .vimrc or somewhere in your include path.

Installation
------------

### Pathogen

The recommended installation method is via [Pathogen][4].  Then simply execute

    cd ~/.vim/bundle
    git clone https://github.com/mxw/vim-jsx.git

[1]: http://facebook.github.io/react/           "React"
[2]: https://github.com/pangloss/vim-javascript "pangloss: vim-javascript"
[3]: https://github.com/mxw/vim-xhp             "mxw: vim-xhp"
[4]: https://github.com/tpope/vim-pathogen      "tpope: vim-pathogen"
