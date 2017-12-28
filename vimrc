set nocompatible
let mapleader = ','

if !executable('git')
  echo "info: [vim] Git is not installed and is required."
  exit
endif

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'sjl/gundo.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-rake'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-vividchalk'
Plug 'vim-ruby/vim-ruby'
Plug 'mileszs/ack.vim'
Plug 'vim-scripts/tComment'
" Plug 'Townk/vim-autoclose'
Plug 'fatih/vim-go'
Plug 'bling/vim-airline'
Plug 'chase/vim-ansible-yaml'
Plug 'altercation/vim-colors-solarized'
Plug 'kien/ctrlp.vim'
Plug 'benekastah/neomake'
Plug 'rust-lang/rust.vim'
Plug 'hashivim/vim-terraform'
Plug 'tpope/vim-repeat'

" Add plugins to &runtimepath
call plug#end()

if isdirectory(expand('~/Library/Python/2.7/lib/python/site-packages/powerline'))
  let g:airline_powerline_fonts = 1
endif

autocmd FileType puppet set commentstring=#\ %s

let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_mruf_relative = 1
nmap <Leader>b :CtrlPBuffer<CR>
nmap <Leader>e :CtrlPMRU<CR>
nmap <Leader>o :CtrlPTag<CR>

set encoding=utf-8
filetype plugin indent on
filetype plugin on

autocmd BufNewFile,BufRead *.coffee set filetype=coffee
autocmd BufRead,BufNewFile *.md set filetype=markdown
autocmd BufRead,BufNewFile *.rs set filetype=rust
autocmd Filetype html,ruby,coffee,javascript,json,htmlcheetah,yaml,scss,css,eruby,xml setlocal ts=2 sts=2 sw=2 expandtab
autocmd Filetype rust setlocal ts=4 sts=4 sw=4 expandtab
set autoindent smartindent smarttab
set backspace=indent,eol,start
set hidden
set laststatus=2 ruler
set list listchars=tab:▸\ ,trail:·
set ignorecase smartcase incsearch
set clipboard=unnamed
set noswapfile
set wildmenu
set wildmode=longest,list
set wildignore+=.git,.hg,.svn
set wildignore+=*.jpg,*.png,*.xpm,*.gif,*.ico
set wildignore+=*~,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,.DS_Store,*.sql
set wildignore+=tags,pkg,log,tmp,vendor/*
set nowrap
set complete-=i
set autoread
set mouse=a
set scrolloff=5
set shortmess+=I
set wrap

autocmd FileType python setlocal softtabstop=4 tabstop=4 shiftwidth=4 textwidth=79
autocmd BufReadPost * if &filetype !~ '^git\c' && line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

if has('persistent_undo')
  silent !mkdir -p ~/.vim/tmp
  set undodir=~/.vim/tmp
  set undofile
endif

set path=$PWD/**
cnoremap %% <C-R>=expand('%:h') . '/' <CR>
nnoremap <Leader><Leader> <c-^>
nnoremap <F1> <nop>

" Tab navigation like Firefox.
nnoremap <C-S-tab> :tabprevious<CR>
nnoremap <C-tab>   :tabnext<CR>
nnoremap <C-t>     :tabnew<CR>
inoremap <C-S-tab> <Esc>:tabprevious<CR>i
inoremap <C-tab>   <Esc>:tabnext<CR>i
inoremap <C-t>     <Esc>:tabnew<CR>

if has('gui_running')
  set guifont=Monaco:h12
  set guioptions=egmtc
  set visualbell
  " set lines=46 columns=88
  nmap <leader>1 :set lines=46 columns=88<CR><C-w>o
  nmap <leader>3 :set lines=50 columns=171<CR><C-w>v
endif

command! Ctags :!ctags --recurse --languages=-javascript,sql --totals=yes --exclude=vendor .
set foldmethod=manual
"set synmaxcol=120
set number

" auto chdir to the file dir
autocmd BufEnter * silent! lcd %:p:h

" =========================
"   Colors
" =========================
"

syntax on
set background=dark
set t_Co=256
let g:solarized_termcolors=256
let g:solarized_termtrans=1
let g:solarized_contrast="normal"
let g:solarized_visibility="normal"
color solarized

" =========================
"   Vim UI
" =========================
"
"       backspace:  '2' allows backspacing" over
"       indentation, end-of-line, and start-of-line.
"       see also "help bs".
  set   backspace=2

"       ruler:       show cursor position?  Yep!
  set   ruler
"
"       shortmess:   Kind of messages to show.   Abbreviate them
"       all!  New since vim-5.0v: flag 'I' to suppress "intro
"       message".
  set   shortmess=at
"
"       showcmd:     Show current uncompleted command?
"       Absolutely!
  set   showcmd

"       showfulltag: (sft) auto completion (great for programming)
" set   showfulltag
"
"       showmode:    Show the current mode?
"       YEEEEEEEEESSSSSSSSSSS!
  set   showmode
"
"       splitbelow:  Create new window below current one.
  set   splitbelow
"
"       Highlight matching parens

  set   showmatch
"
" Try to show at least three lines and two columns of context when
" scrolling
  set   scrolloff=3
  set   sidescrolloff=2
"
"       mouse: enable mouse scrolling, mouse selection etc.
" set mouse=a
"
"       modeline:  Allow the last line to be a modeline - useful
"       when the last line in sig gives the preferred textwidth
"       for replies.
if (v:version == 603 && has("patch045")) || (v:version > 603)
  set   modeline
  set   modelines=1
else
  set   nomodeline
endif
"
"       foldenable: When off, all folds are open.
  set   nofoldenable
"
" Nice statusbar
  set   laststatus=2
  set   statusline=
  set   statusline+=%-3.3n\                      " buffer number
  set   statusline+=%f\                          " file name
  set   statusline+=%h%m%r%w                     " flags
  set   statusline+=\[%{strlen(&ft)?&ft:'none'}, " filetype
  set   statusline+=%{&encoding},                " encoding
  set   statusline+=%{&fileformat}]              " file format

  set   statusline+=%=                           " right align
  set   statusline+=0x%-8B\                      " current char
  set   statusline+=%-14.(%l,%c%V%)\ %<%P        " offset

  set statusline+=%#warningmsg#
  set statusline+=%{SyntasticStatuslineFlag()}
  set statusline+=%*

  let g:neomake_enabled_makers = ['go', 'golint', 'govet', 'ruby']
  autocmd! BufWritePost * Neomake

" If possible, try to use a narrow number column.
if v:version >= 700
    try
        setlocal numberwidth=3
    catch
    endtry
endif

set cursorline
