" Vim compiler file for python3
" Compiler: python3
" Maintainer: luqi.pan@gmail.com
" Last Change: 2013-12-31 Tue

if exists("current_compiler")
    finish
endif
let current_compiler = "python3"

setlocal makeprg=python3\ %

setlocal errorformat =
    \%f(%l):\ Error:\ %m

" vim: filetype=vim
