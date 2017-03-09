set nocompatible

if has("unix")
	let plugdir='~/.vim/plugged'
elseif has("win32")
	let plugdir='~\vimfiles\plugged'
endif

call plug#begin(plugdir)

Plug 'ctrlpvim/ctrlp.vim'
Plug 'derekwyatt/vim-fswitch'
Plug 'godlygeek/tabular'
Plug 'majutsushi/tagbar'
Plug 'mhinz/vim-signify'
Plug 'msanders/snipmate.vim'
Plug 'scrooloose/nerdtree'
Plug 'tomasr/molokai'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-git'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-vividchalk'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-syntastic/syntastic'

call plug#end()

set encoding=utf-8
set laststatus=2

let g:netrw_dirhistmax = 0

let g:airline_symbols_ascii = 1
let g:airline#extensions#tabline#enabled = 1

let g:ctrlp_extensions = ['tag']

if has("win32") && has("gui_running")
	set lines=24
	set columns=80
	set guifont=Consolas:h14
	set guioptions-=L
	set guioptions-=T
	set guioptions-=m
	set guioptions-=r
endif

" general {{{1
if has('path_extra')
	setglobal tags-=./tags tags-=./tags; tags^=./tags;
endif

set autoread
set backspace=indent,eol,start
set complete-=i
set nocursorline
silent! set cryptmethod=blowfish2
set formatoptions+=j
set hidden
set ignorecase smartcase
set nojoinspaces
set nrformats-=octal
set ruler
set showcmd
set smarttab
set virtualedit=all

" functions {{{1
" GetEncoding() {{{2
function! GetEncoding()
	return '[' . (&fileencoding  != '' ? &fileencoding : &encoding) . ']'
endfunction

" RestoreCursor() {{{2
function! RestoreCursor()
	if line("'\"") > 0 && line("'\"") <= line("$")
		execute "normal! g`\""
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

if has("unix")
	set backupdir^=~/.vim/backup
	set undodir^=~/.vim/undo
elseif has("win32")
	set backupdir^=~\vimfiles\backup
	set undodir^=~\vimfiles\undo
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
"
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" show unprintable characters {{{1
set list
set listchars=tab:»\ ,extends:›,precedes:‹,nbsp:·,trail:·

" colorscheme {{{1
silent! colorscheme molokai

" misc {{{1
let NERDTreeChDirMode = 2
let NERDTreeWinSize = 30
" let loaded_matchparen = 1 " don't highlight matching parens
" let g:load_doxygen_syntax = 1

" let g:vimwiki_browsers = ['chromium']
let g:vimwiki_list = [{
	\ 'template_path': '~/vimwiki_html/templates/',
	\ 'template_default': 'default',
	\ 'template_ext': '.tpl'
\ }, {
	\ 'path': '~/dropbox/MeuCarrinho/Gestão de Benchmarking/wiki_raw',
	\ 'path_html': '~/dropbox/MeuCarrinho/Gestão de Benchmarking/wiki_html',
	\ 'template_path': '~/dropbox/MeuCarrinho/Gestão de Benchmarking/wiki_html/templates/',
	\ 'template_default': 'default',
	\ 'template_ext': '.tpl'
\ }]

let g:tagbar_width = 30
let g:tagbar_type_vimwiki = {
	\ 'ctagstype' : 'vimwiki',
	\ 'kinds'     : [
		\ 'h:Headers'
	\ ],
	\ 'sort'      : 0
\ }

" keybindings {{{1
nmap <silent> ,N :<C-U>execute 'bprevious ' . (v:count == 0 ? '' : v:count)<CR>
nmap <silent> ,P :<C-U>execute 'bnext     ' . (v:count == 0 ? '' : v:count)<CR>
nmap <silent> ,n :<C-U>execute 'bnext     ' . (v:count == 0 ? '' : v:count)<CR>
nmap <silent> ,p :<C-U>execute 'bprevious ' . (v:count == 0 ? '' : v:count)<CR>
nnoremap <silent> ,1 :buffer  1<CR>
nnoremap <silent> ,2 :buffer  2<CR>
nnoremap <silent> ,3 :buffer  3<CR>
nnoremap <silent> ,4 :buffer  4<CR>
nnoremap <silent> ,5 :buffer  5<CR>
nnoremap <silent> ,6 :buffer  6<CR>
nnoremap <silent> ,7 :buffer  7<CR>
nnoremap <silent> ,8 :buffer  8<CR>
nnoremap <silent> ,9 :buffer  9<CR>
nnoremap <silent> ,0 :buffer 10<CR>
nnoremap <silent> ,d :bd<CR>
nnoremap <silent> ,c :BD<CR>
nnoremap <silent> ,, <C-^>
nnoremap <silent> ,h <C-W>h
nnoremap <silent> ,j <C-W>j
nnoremap <silent> ,k <C-W>k
nnoremap <silent> ,l <C-W>l
nnoremap <silent> ,o <C-W>o
nnoremap <silent> ,s <C-W>s
nnoremap <silent> ,v <C-W>v
nnoremap <silent> <F2> <ESC>:NERDTreeToggle<CR>
inoremap <silent> <F2> <ESC>:NERDTreeToggle<CR>
nnoremap <silent> <F3> <ESC>:TagbarToggle<CR>
inoremap <silent> <F3> <ESC>:TagbarToggle<CR>
nnoremap <silent> <F5> <ESC>:bprevious<CR>
inoremap <silent> <F5> <ESC>:bprevious<CR>
nnoremap <silent> <F6> <ESC>:bnext<CR>
inoremap <silent> <F6> <ESC>:bnext<CR>
nnoremap <silent> <F7> <ESC><C-W>W
inoremap <silent> <F7> <ESC><C-W>W
nnoremap <silent> <F8> <ESC><C-W>w
inoremap <silent> <F8> <ESC><C-W>w
nnoremap <silent> <C-L> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>
