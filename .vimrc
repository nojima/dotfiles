" vim: foldmethod=marker sw=2 ts=2 expandtab
" NeoBundle {{{
set nocompatible
filetype off
filetype plugin indent off

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
  call neobundle#rc(expand('~/.vim/bundle/'))
endif
" golang {{{
if $GOROOT != ''
  set runtimepath+=$GOROOT/misc/vim
endif
if $GOPATH != ''
  exe "set runtimepath+=".globpath($GOPATH, "src/github.com/nsf/gocode/vim")
endif
" }}}

" Bundles
NeoBundle 'Shougo/vimproc'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'kana/vim-textobj-user'
NeoBundle 'kana/vim-textobj-indent'
NeoBundle 'kana/vim-textobj-line'
NeoBundle 'vim-jp/cpp-vim'
NeoBundle 'inkpot'
NeoBundle 'plasticboy/vim-markdown'
NeoBundle 'mbbill/undotree'
if has('lua')
  NeoBundle 'Shougo/neocomplete.vim'
endif
NeoBundle 'scrooloose/syntastic'

filetype plugin indent on
" }}}

" Options {{{
syntax on
silent! colorscheme inkpot
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
if has('persistent_undo')
  set undodir=$HOME/.vim_undo
  set undofile
endif
" }}}

" Keymap {{{
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
" }}}

" Misc {{{
runtime macros/matchit.vim
" }}}

" Neocomplete {{{
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
" }}}

" unite.vim {{{
function! MyUniteFileRec()
  call system('git rev-parse --is-inside-work-tree > /dev/null 2>&1')
  if v:shell_error
    execute 'Unite file_rec/async'
  else
    execute 'Unite file_rec/git'
  endif
endfunction
nnoremap <Space>f :<C-u>Unite file file/new<CR>
nnoremap <Space>b :<C-u>Unite buffer<CR>
nnoremap <Space>r :<C-u>call MyUniteFileRec()<CR>
nnoremap <Space>g :<C-u>Unite grep:. -no-quit<CR>
let g:unite_enable_start_insert = 1
" }}}

" markdown {{{
let g:vim_markdown_folding_disabled = 1
" }}}

" syntastic {{{
let g:syntastic_cpp_compiler = 'g++'
let g:syntastic_cpp_compiler_options = ' -std=gnu++11 -DCACHELINE_SIZE=64'
let g:syntastic_mode_map = { 'mode': 'active',
                           \ 'active_filetypes': ['python', 'c++', 'c'] }
" }}}

autocmd FileType python setlocal completeopt-=preview
