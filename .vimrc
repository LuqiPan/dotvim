" Use Vim settings, rather then Vi settings
set nocompatible

" Pathogen disabled plugins list
" No need: I've deleted vim-airline
" let g:pathogen_disabled = [""]

" Start pathogen
execute pathogen#incubate()
execute pathogen#infect()
execute pathogen#helptags()

" Enable syntax highlighting.
syntax on

" Try to detect filetype
filetype on
filetype indent on
filetype plugin on

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
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab

" Display cursor position
set ruler
set hidden

" Show autocomplete menus
set wildmenu

" Status line
set laststatus=2
set statusline=
"set statusline+=%-3.3n\                      " buffer number
"set statusline+=%f\                          " filename
"set statusline+=%h%m%r%w                     " status flags
"set statusline+=\[%{strlen(&ft)?&ft:'none'}] " file type
"set statusline+=%=                           " right align remainder
"set statusline+=0x%-8B                       " character value
"set statusline+=%-14(%l,%c%V%)               " line, character
"set statusline+=%<%P                         " file position

" Set command line height to 2 lines
set cmdheight=2

" Set the colorscheme to default
" Since the colorscheme of the terminal has already been set to solarized
set background=light
colorscheme default

" Error bells are displayed visually.
set visualbell

" use XML plugin for .xml files
"autocmd BufNewFile,BufRead *.xml source ~/.vim/ftplugin/xml.vim
" autocmd BufNewFile *.xml source ~/.vim/ftplugin/xmlheader.vim

" plugins for python
autocmd BufNewFile,BufRead *.py compiler python

" plugins to make jekyll build for markdown
autocmd BufNewFile,BufRead *.md compiler md
autocmd BufNewFile,BufRead *.md setlocal shiftwidth=4 softtabstop=4 tabstop=4

" map :W to :w | :make
command W execute "w | make"

" use space to open and close fold
nnoremap <space> za  

" ============================================================
"set foldmethod=indent

" automatically create and update cscope database
nmap <F11> :!find . -iname '*.c' -o -iname '*.cpp' -o -iname '*.h' -o -iname '*.hpp' > cscope.files<CR>
  \:!cscope -b -i cscope.files -f cscope.out<CR>
  \:cs reset<CR>

" automatically convert the format to unix style
set fileformat=unix

" filetype plugin on

" disable folding
set nofen
set foldlevel=99

" set 256 colors
set t_Co=256

" setting up airline
let g:airline_theme='bubblegum'

set ttimeoutlen=50
set encoding=utf-8
set scrolloff=50

" backspace problems
set backspace=2

" Run the current file with rspec
map <Leader>rb :call VimuxRunCommand("clear; rspec " . bufname("%"))<CR>

" Prompt for a command to run
map <Leader>vp :VimuxPromptCommand<CR>

" Run last command executed by VimuxRunCommand
map <Leader>vl :VimuxRunLastCommand<CR>

" Inspect runner pane
map <Leader>vi :VimuxInspectRunner<CR>

" Close vim tmux runner opened by VimuxRunCommand
map <Leader>vq :VimuxCloseRunner<CR>

" Interrupt any command running in the runner pane
map <Leader>vx :VimuxInterruptRunner<CR>

" Zoom the runner pane (use <bind-key> z to restore runner pane)
map <Leader>vz :call VimuxZoomRunner()<CR>

" workaround for ack.vim problem
set shell=bash

" set swap file location
set directory=$HOME/.vim/swapfiles//

" 80-column mark
set colorcolumn=81

" Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>

" " Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:↩,trail:□
