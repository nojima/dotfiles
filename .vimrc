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
set runtimepath+=$GOROOT/misc/vim
exe "set runtimepath+=".globpath($GOPATH, "src/github.com/nsf/gocode/vim")

" Bundles
NeoBundle 'Shougo/vimproc'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'tpope/vim-surround'
NeoBundle 'kana/vim-textobj-user'
NeoBundle 'kana/vim-textobj-indent'
NeoBundle 'kana/vim-textobj-line'
NeoBundle 'vim-jp/cpp-vim'
NeoBundle 'inkpot'
NeoBundle 'plasticboy/vim-markdown'
if has('lua')
  NeoBundle 'Shougo/neocomplete.vim'
endif

filetype plugin indent on


"
" Options
"
syntax on
colorscheme inkpot
set encoding=utf-8
set shiftwidth=4
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
set list
set listchars=tab:»\ ,trail:-,extends:»,precedes:«,nbsp:%


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
runtime macros/matchit.vim

if has('lua')
  let g:neocomplete#enable_at_startup = 1
  let g:neocomplete#enable_smart_case = 1
  let g:neocomplete#sources#syntax#min_keyword_length = 3
  let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

  inoremap <expr><C-g> neocomplete#undo_completion()
  inoremap <expr><C-l> neocomplete#complete_common_string()

  inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
  function! s:my_cr_function()
    return neocomplete#close_popup() . "\<CR>"
  endfunction
  inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
  inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
  inoremap <expr><BS>  neocomplete#smart_close_popup()."\<C-h>"
endif

" unite.vim
nnoremap <Space>f :<C-u>Unite file file/new<CR>
nnoremap <Space>b :<C-u>Unite buffer<CR>
nnoremap <Space>r :<C-u>Unite file_rec/async<CR>
let g:unite_enable_start_insert = 1

" markdown
let g:vim_markdown_folding_disabled = 1

autocmd FileType python setlocal completeopt-=preview
