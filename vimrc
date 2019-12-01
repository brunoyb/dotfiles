set nocompatible

if has('unix')
	let plugdir='~/.vim/plugged'
elseif has('win32')
	let plugdir='~\vimfiles\plugged'
endif

call plug#begin(plugdir)

Plug 'ctrlpvim/ctrlp.vim'
Plug 'dense-analysis/ale'
Plug 'derekwyatt/vim-fswitch'
Plug 'fatih/vim-go'
Plug 'godlygeek/tabular'
Plug 'hashivim/vim-terraform'
Plug 'maksimr/vim-jsbeautify'
Plug 'mhinz/vim-signify'
Plug 'PProvost/vim-ps1'
Plug 'qpkorr/vim-bufkill'
Plug 'stephpy/vim-yaml'
Plug 'tomasr/molokai'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dadbod'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-git'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-vividchalk'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

call plug#end()

set encoding=utf-8
set laststatus=2

let g:airline#extensions#tabline#enabled = 1
let g:airline_symbols_ascii = 1
let g:ale_linters_explicit = 1
let g:ctrlp_extensions = ['tag']
let g:go_doc_keywordprg_enabled = 0
let g:go_fmt_command = 'goimports'
let g:netrw_dirhistmax = 0
let g:terraform_fmt_on_save = 1

if has('win32') && has('gui_running')
	set lines=24
	set columns=80
	set guifont=Consolas:h14
	set guioptions-=L
	set guioptions-=T
	set guioptions-=m
	set guioptions-=r
endif

if executable('rg')
	set grepprg=rg\ --vimgrep
	set grepformat=%f:%l:%c:%m

	let g:ctrlp_user_command = 'rg --color never --glob "" --files %s'
	let g:ctrlp_use_caching = 0
endif

command! -nargs=1 -bar Grep execute 'silent! grep! <q-args>' | redraw! | cwindow

nnoremap K :Grep <cword><CR>

if has('unnamedplus')
	set clipboard=unnamedplus
else
	set clipboard=unnamed
endif

" general {{{1
set autoread
set backspace=indent,eol,start
set complete-=i
silent! set cryptmethod=blowfish2
set nocursorline
set formatoptions+=j
set ignorecase smartcase
set nojoinspaces
set nrformats-=octal
set ruler
set showcmd
set smarttab
set nostartofline
set tags^=./.git/tags;
set virtualedit=all

" functions {{{1
" GetEncoding() {{{2
function! GetEncoding()
	return '[' . (&fileencoding  != '' ? &fileencoding : &encoding) . ']'
endfunction

" RestoreCursor() {{{2
function! RestoreCursor()
	if line("'\"") > 0 && line("'\"") <= line("$")
		execute 'normal! g`"'
	endif
endfunction

" autocmd {{{1
augroup mycppfiles
	autocmd!
	autocmd BufEnter *.cpp let b:fswitchdst = 'hpp'
	autocmd BufEnter *.cpp let b:fswitchlocs = '.'
augroup END

augroup myhppfiles
	autocmd!
	autocmd BufEnter *.hpp let b:fswitchdst = 'cpp'
	autocmd BufEnter *.hpp let b:fswitchlocs = '.'
augroup END

augroup myvimrc
	autocmd!
	autocmd BufReadPost * call RestoreCursor()
augroup END

" backup & undofile {{{1
set backup
set undofile

if has('unix')
	set backupdir^=~/.vim/backup//
	set directory^=~/.vim/swap//
	set undodir^=~/.vim/undo//
elseif has('win32')
	set backupdir^=~\vimfiles\backup//
	set directory^=~\vimfiles\swap//
	set undodir^=~\vimfiles\undo//
endif

" scrolling {{{1
set nowrap
set scrolloff=1
set sidescrolloff=5

" folding {{{1
set foldenable
set foldmethod=marker

" search {{{1
set incsearch
set hlsearch

" command-line completion {{{1
set wildignorecase
set wildmenu
set wildmode=full

" indent {{{1
set autoindent
" set smartindent

" statusline {{{1
"set statusline=%<%t\ %y%{GetEncoding()}%m%h%w%r%=%-14.(%l,%c%V%)\ %P

" show unprintable characters {{{1
set list
set listchars=tab:»\ ,extends:›,precedes:‹,nbsp:·,trail:·

" colorscheme {{{1
silent! colorscheme molokai

" keybindings {{{1
nnoremap <silent> ,, <C-^>
nnoremap <silent> ,h <C-W>h
nnoremap <silent> ,j <C-W>j
nnoremap <silent> ,k <C-W>k
nnoremap <silent> ,l <C-W>l
nnoremap <silent> ,o <C-W>o
nnoremap <silent> ,s <C-W>s
nnoremap <silent> ,v <C-W>v

nnoremap <F9> :Dispatch<CR>
