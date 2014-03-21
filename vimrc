set nocompatible
let mapleader = ','

if !executable('git')
  echo "info: [vim] Git is not installed and is required."
  exit
elseif !isdirectory(expand('~/.vim/bundle/vundle'))
  silent !git clone git://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
  let s:bootstrap=1
endif

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'puppetlabs/puppet-syntax-vim'
Bundle 'sjl/gundo.vim'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-rake'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-vividchalk'
Bundle 'vim-ruby/vim-ruby'
Bundle 'mileszs/ack.vim'
Bundle 'vim-scripts/tComment'
Bundle 'scrooloose/syntastic'
Bundle 'Townk/vim-autoclose'
Bundle 'jnwhiteh/vim-golang'
Bundle 'ervandew/supertab'
Bundle 'bling/vim-airline'
if isdirectory(expand('~/Library/Python/2.7/lib/python/site-packages/powerline'))
  let g:airline_powerline_fonts = 1
endif

autocmd FileType puppet set commentstring=#\ %s

Bundle 'Shougo/vimproc.vim'
Bundle 'Shougo/neomru.vim'
Bundle 'Shougo/unite.vim'
nnoremap <silent> <Leader>m :Unite -buffer-name=recent -winheight=10 file_mru<cr>
nnoremap <Leader>b :Unite -buffer-name=buffers -winheight=10 buffer<cr>
nnoremap <Leader>f :Unite grep:.<cr>

Bundle 'kien/ctrlp.vim'
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_mruf_relative = 1
nmap <Leader>b :CtrlPBuffer<CR>
nmap <Leader>e :CtrlPMRU<CR>
nmap <Leader>o :CtrlPTag<CR>

if exists("s:bootstrap") && s:bootstrap
  unlet s:bootstrap
  BundleInstall
endif

syntax enable
set background=dark
color vividchalk
set encoding=utf-8
filetype plugin indent on
filetype plugin on

" set tabstop=2 softtabstop=2 shiftwidth=2 textwidth=0 expandtab
autocmd Filetype html setlocal ts=2 sts=2 sw=2 expandtab
autocmd Filetype ruby setlocal ts=2 sts=2 sw=2 expandtab
autocmd BufNewFile,BufRead *.coffee set filetype=coffee
autocmd Filetype coffee setlocal ts=2 sts=2 sw=2 expandtab
autocmd Filetype javascript setlocal ts=4 sts=4 sw=4 expandtab
autocmd Filetype go setlocal ts=4 sts=4 sw=4
autocmd Filetype yaml setlocal ts=2 sts=2 sw=2
autocmd Filetype scss setlocal ts=2 sts=2 sw=2 expandtab
autocmd Filetype css setlocal ts=2 sts=2 sw=2 expandtab
autocmd Filetype eruby setlocal ts=2 sts=2 sw=2 expandtab
" Autoformat go source files
autocmd FileType go autocmd BufWritePre <buffer> Fmt
autocmd BufRead,BufNewFile *.md set filetype=markdown
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
set wildignore+=tags,pkg,log,tmp,vendor/bundle,vendor/cache
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

if has('gui_running')
  set guifont=Monaco:h12
  set guioptions=egmtc
  set visualbell
  " set lines=46 columns=88
  nmap <leader>1 :set lines=46 columns=88<CR><C-w>o
  nmap <leader>2 :set lines=50 columns=171<CR><C-w>v
endif

command! Ctags :!ctags --recurse --languages=-javascript,sql --totals=yes --exclude=vendor .
set foldmethod=manual
"set synmaxcol=120
