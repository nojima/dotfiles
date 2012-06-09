"
" NeoBundle
"
set nocompatible
filetype off
filetype plugin indent off

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
  call neobundle#rc(expand('~/.vim/bundle/'))
endif

" Bundles
NeoBundle 'Shougo/vimproc'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'tcope/vim-surround'
NeoBundle 'kana/vim-textobj-user'
NeoBundle 'kana/vim-textobj-indent'
NeoBundle 'inkpot'

filetype plugin indent on


"
" Options
"
syntax on
colorscheme inkpot
set encoding=utf-8
set shiftwidth=2
set expandtab
set smarttab
set cindent
set backspace=2
set wildmenu
set formatoptions+=mM
set formatoptions-=ro
set number
set laststatus=2
set showcmd
set scrolloff=5
set nocp incsearch
set statusline=%<%f\ %h%m%r%y%=%l,%v\ %LL\ %{(&fenc!=''?&fenc:&enc).'/'.&ff}
set ignorecase
set smartcase
set backup
set backupdir=$HOME/.vim_backup
set autochdir
set hidden
set fileencodings=ucs-bom,utf-8,iso-2022-jp,euc-jp,cp932,utf-16,utf-16le,latin1
set fileformats=unix,dos,mac
set cinoptions=:0,p0,t0
set cinwords=if,else,while,do,for,switch,case
set hlsearch
set t_Co=256
set vb t_vb=


"
" Keymap
"
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk
nnoremap <Down> g<Down>
nnoremap <Up> g<Up>
inoremap <Down> <C-o>gj
inoremap <Up> <C-o>gk
vnoremap <Down> g<Down>
vnoremap <Up> g<Up>


"
" Misc
"

" load matchit
runtime macros/matchit.vim

" highlight tailing whitespaces
highlight TailingWhitespace ctermbg=yellow guibg=yellow
match TailingWhitespace /\s\+$/
autocmd BufWinEnter * match TailingWhitespace /\s\+$/
autocmd InsertEnter * match TailingWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match TailingWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()
