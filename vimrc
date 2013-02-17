set nocompatible

runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()

if has("win32")
	set encoding=utf-8

	if has("gui_running")
		set lines=24
		set columns=80
		set guifont=Consolas:h14
		set guioptions-=L
		set guioptions-=T
		set guioptions-=m
		set guioptions-=r
	endif
endif

" general {{{1
set backspace=indent,eol,start
set cryptmethod=blowfish
set nonumber
set showcmd
set showmode
set showtabline=1
set virtualedit=all
set nojoinspaces
set viminfo='100,<50,s10,h
set nrformats=hex
set hidden
" set cursorline

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
	set backupdir=~/.vim/backup,.
	set undodir=~/.vim/undo,.
elseif has("win32")
	set backupdir=~\vimfiles\backup,.
	set undodir=~\vimfiles\undo,.
endif

" scrolling {{{1
set nowrap
" set scrolloff=5
" set sidescroll=1
" set sidescrolloff=5

" folding {{{1
set foldenable
set foldmethod=marker

" search {{{1
set hlsearch
set incsearch

" command-line completion {{{1
set wildmenu
set wildmode=full

" indent {{{1
set autoindent
set smartindent

" statusline {{{1
set laststatus=2
set statusline=%<%t\ %y%{GetEncoding()}%m%h%w%r%=%-14.(%l,%c%V%)\ %P

" show unprintable characters {{{1
set list
set listchars=extends:»,precedes:«,tab:>·,trail:·
set showbreak=+++

" syntax {{{1
filetype plugin indent on
syntax enable

" colorscheme {{{1
colorscheme molokai

" misc {{{1
let NERDTreeWinSize = 30
let loaded_matchparen = 1 " don't highlight matching parens
" let g:load_doxygen_syntax = 1

let g:vimwiki_browsers = ['chromium']
let g:vimwiki_list = [{
	\ 'template_path': '~/vimwiki_html/templates/',
	\ 'template_default': 'default',
	\ 'template_ext': '.tpl'
\ }, {
	\ 'path': '~/dropbox/MeuCarrinho - Gestão/Gestão de Benchmarking/wiki_raw',
	\ 'path_html': '~/dropbox/MeuCarrinho - Gestão/Gestão de Benchmarking/wiki_html',
	\ 'template_path': '~/dropbox/MeuCarrinho - Gestão/Gestão de Benchmarking/wiki_html/templates/',
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
nnoremap <silent> <F2> <ESC>:nohlsearch<CR>
inoremap <silent> <F2> <ESC>:nohlsearch<CR>
nnoremap <silent> <F3> <ESC>:NERDTreeToggle<CR>
inoremap <silent> <F3> <ESC>:NERDTreeToggle<CR>
nnoremap <silent> <F4> <ESC>:TagbarToggle<CR>
inoremap <silent> <F4> <ESC>:TagbarToggle<CR>
nnoremap <silent> <F5> <ESC>:bprevious<CR>
inoremap <silent> <F5> <ESC>:bprevious<CR>
nnoremap <silent> <F6> <ESC>:bnext<CR>
inoremap <silent> <F6> <ESC>:bnext<CR>
nnoremap <silent> <F7> <ESC><C-W>W
inoremap <silent> <F7> <ESC><C-W>W
nnoremap <silent> <F8> <ESC><C-W>w
inoremap <silent> <F8> <ESC><C-W>w
