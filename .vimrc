" Use Vim settings, rather then Vi settings
set nocompatible

" Start pathogen
execute pathogen#incubate()
execute pathogen#infect()
execute pathogen#helptags()

" Enable syntax highlighting.
syntax on

" Try to detect filetype
filetype on

" Load indent file for filetype
" filetype plugin indent on

" Use UTF-8
set encoding=utf-8

set hlsearch

" Search as you type
set incsearch

" Smart decide cases
set smartcase
set ignorecase

" Lines to keep above and below the cursor
set scrolloff=3

" Show line number
set nu

" Display incomplete commands 
set showcmd

" Show editing mode
set showmode
set autoread

" Automatically indent when adding a curly bracket, etc.
set smartindent

" Tabs should be converted to a group of 4 spaces
set smarttab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab

" Display cursor position
set ruler
set hidden

" Show autocomplete menus
set wildmenu

" Status line
set laststatus=2
set statusline=
set statusline+=%-3.3n\                      " buffer number
set statusline+=%f\                          " filename
set statusline+=%h%m%r%w                     " status flags
set statusline+=\[%{strlen(&ft)?&ft:'none'}] " file type
set statusline+=%=                           " right align remainder
set statusline+=0x%-8B                       " character value
set statusline+=%-14(%l,%c%V%)               " line, character
set statusline+=%<%P                         " file position

" Set command line height to 2 lines
set cmdheight=2

" Set the colorscheme to solarized
set background=light
colorscheme solarized

" Error bells are displayed visually.
set visualbell

" use XML plugin for .xml files
autocmd BufNewFile,BufRead *.xml source ~/.vim/ftplugin/xml.vim
" autocmd BufNewFile *.xml source ~/.vim/ftplugin/xmlheader.vim

" plugins for python
autocmd BufNewFile,BufRead *.py compiler python

" plugins to make jekyll build for markdown
autocmd BufNewFile,BufRead *.md compiler md

" map :W to :w | :make
command W execute "w | make"

" use space to open and close fold
nnoremap <space> za  
" ============================================================
"set foldmethod=indent
