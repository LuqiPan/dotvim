" Use Vim settings, rather then Vi settings
set nocompatible

" Pathogen disabled plugins list
" No need: I've deleted vim-airline
" let g:pathogen_disabled = [""]

" Bind leader key to ,
let mapleader=","

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

" highlight search
set hlsearch

" Search as you type
set incsearch

" Smart decide cases
set smartcase
set ignorecase

" Lines to keep above and below the cursor
set scrolloff=99

" Show line number
set nu

" Display incomplete commands
set showcmd

" Show editing mode
set showmode

" Let vim auto reload file if it is changed
set autoread

" Automatically indent when adding a curly bracket, etc.
set smartindent

" Tabs should be converted to a group of 2 spaces
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab

" Display cursor position
set ruler

" Allow creating hidden buffer
set hidden

" Show autocomplete menus
set wildmenu

" Status line
set laststatus=2

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
command! W execute "w | make"

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

" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:↩,trail:□

" Strip trailing whitespaces
function! <SID>StripTrailingWhitespaces()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction

" binding to strip trailing whitespaces
nnoremap <leader>stw :call <SID>StripTrailingWhitespaces()<CR>
" strip trailing whitespaces before save
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

if has("autocmd")
  " Source the vimrc file after saving it
  autocmd bufwritepost .vimrc source $MYVIMRC
endif

" \v to edit vimrc file in current window
nnoremap <leader>vrc :tabedit $MYVIMRC<CR>

" highlight extra white spaces
if exists('+colorcolumn')
  set colorcolumn=81
else
  match ErrorMsg '\%>80v.\+'
endif
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/

" ,, to switch between 2 recent tabs
nnoremap <leader><leader> <c-^>

" config gitgutter
let g:gitgutter_realtime=1
let g:gitgutter_eager=1
