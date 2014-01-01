" Vim compiler file for python3
" Compiler: Markdown + Jekyll
" Maintainer: luqi.pan@gmail.com
" Last Change: 2013-12-31 Tue

if exists("current_compiler")
    finish
endif
let current_compiler = "jekyll"

setlocal makeprg=jekyll\ build

setlocal errorformat =
    \%f(%l):\ Error:\ %m

" vim: filetype=vim
