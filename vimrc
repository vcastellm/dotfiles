set nocompatible
let mapleader = ','

if !executable('git')
  echo "info: [vim] Git is not installed and is required."
  exit
elseif !isdirectory(expand('~/.vim/bundle/vundle'))
  silent !git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
  let s:bootstrap=1
endif

set runtimepath+=~/.vim/bundle/neobundle.vim/
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundleFetch 'sjl/gundo.vim'
NeoBundleFetch 'tpope/vim-fugitive'
NeoBundleFetch 'tpope/vim-rails'
NeoBundleFetch 'tpope/vim-rake'
NeoBundleFetch 'tpope/vim-surround'
NeoBundleFetch 'tpope/vim-vividchalk'
NeoBundleFetch 'vim-ruby/vim-ruby'
NeoBundleFetch 'mileszs/ack.vim'
NeoBundleFetch 'vim-scripts/tComment'
NeoBundleFetch 'scrooloose/syntastic'
NeoBundleFetch 'Townk/vim-autoclose'
NeoBundleFetch 'fatih/vim-go'
NeoBundleFetch 'ervandew/supertab'
NeoBundleFetch 'bling/vim-airline'
NeoBundleFetch 'chase/vim-ansible-yaml'
NeoBundleFetch 'altercation/vim-colors-solarized'
NeoBundleFetch 'kien/ctrlp.vim'

call neobundle#end()
NeoBundleCheck

if isdirectory(expand('~/Library/Python/2.7/lib/python/site-packages/powerline'))
  let g:airline_powerline_fonts = 1
endif

autocmd FileType puppet set commentstring=#\ %s

let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_mruf_relative = 1
nmap <Leader>b :CtrlPBuffer<CR>
nmap <Leader>e :CtrlPMRU<CR>
nmap <Leader>o :CtrlPTag<CR>

if exists("s:bootstrap") && s:bootstrap
  unlet s:bootstrap
  NeoBundleInstall
endif

set encoding=utf-8
filetype plugin indent on
filetype plugin on

" set tabstop=2 softtabstop=2 shiftwidth=2 textwidth=0 expandtab
autocmd Filetype html setlocal ts=2 sts=2 sw=2 expandtab
autocmd Filetype ruby setlocal ts=2 sts=2 sw=2 expandtab
autocmd BufNewFile,BufRead *.coffee set filetype=coffee
autocmd Filetype coffee setlocal ts=2 sts=2 sw=2 expandtab
autocmd Filetype javascript setlocal ts=2 sts=2 sw=2 expandtab
autocmd Filetype htmlcheetah setlocal ts=2 sts=2 sw=2 expandtab
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
" Try to load a nice colourscheme

syntax on
set background=dark
color vividchalk

fun! LoadColourScheme(schemes)
    let l:schemes = a:schemes . ":"
    while l:schemes != ""
        let l:scheme = strpart(l:schemes, 0, stridx(l:schemes, ":"))
        let l:schemes = strpart(l:schemes, stridx(l:schemes, ":") + 1)
        try
            exec "colorscheme" l:scheme
            break
        catch
        endtry
    endwhile
endfun

if has('gui')
   call LoadColourScheme("inkpot:night:rainbow_night:darkblue:elflord")
else
   if &t_Co == 88 || &t_Co == 256
       call LoadColourScheme("vividchalk:inkpot:desert256:darkblack:darkblue:elflord")
    else
"       call LoadColourScheme("desert256:darkblack:desert:darkblue:elflord")
"       Colorize some default highlight groups
"       see ":help highlight-default"
"
"            Comments: Colorizing the "comments" (see ":help comments").
"            cyan on white does not look good on a black background..
          hi comment                           ctermfg=cyan   ctermbg=black
"         hi comment                           ctermfg=cyan   ctermbg=7
"
"       hi Cursor
"       hi Directory
"       hi ErrorMsg
"       hi FoldColumn
"       hi Folded
"       hi IncSearch
"
"            LineNr:  Colorize the line numbers (displayed with
"            "set number").
"            Turn off default underlining of line numbers:
          hi LineNr term=NONE cterm=NONE ctermfg=grey ctermbg=black
"
"       hi ModeMsg
"       hi MoreMsg
"
"         coloring "nontext", ie TABs, trailing spaces,  end-of-lines,
"         and the "tilde lines" representing lines after end-of-buffer.
          hi NonText term=NONE cterm=NONE ctermfg=blue   ctermbg=black
"
"            Normal text:    Use white on black.
"         hi normal ctermfg=white ctermbg=black guifg=white guibg=black
          hi normal ctermfg=grey  ctermbg=black guifg=grey guibg=black
"       Oops - this overrides the colors for the status line - DANG!
"
"       hi Question
"
"            Search: Coloring "search matches".  Use white on red.
          hi search  ctermfg=white ctermbg=red     guifg=white guibg=red
"
"         hi SpecialKey
"
"            statusline: coloring the status line -> is not possible :-(
"         hi StatusLine  term=NONE cterm=NONE ctermfg=yellow ctermbg=red
"
"         hi Title
"         hi VertSplit
"         hi Visual
"         hi VisualNOS
"         hi WarningMsg
"         hi WildMenu
"
"         Other Groups:
"
"            Normal:  Coloring the text with a default color.
          hi normal       term=NONE
    endif
endif


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

if filereadable(expand("$VIM/vimfiles/plugin/vimbuddy.vim"))
  set   statusline+=\ %{VimBuddy()}          " vim buddy
endif
  set   statusline+=%=                           " right align
  set   statusline+=0x%-8B\                      " current char
  set   statusline+=%-14.(%l,%c%V%)\ %<%P        " offset

" If possible, try to use a narrow number column.
if v:version >= 700
    try
        setlocal numberwidth=3
    catch
    endtry
endif
