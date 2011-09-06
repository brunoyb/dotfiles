set nocompatible

runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()

" general {{{1
set backspace=indent,eol,start
set cryptmethod=blowfish
set nonumber
set showcmd
set showmode
set showtabline=1
set virtualedit=all
set joinspaces
set viminfo='100,<50,s10,h
set nrformats=hex
set hidden

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
augroup vimrc
	autocmd!
	autocmd BufReadPost * call RestoreCursor()
augroup END

" backup & undofile {{{1
set backup
set backupdir=~/.vim/backup
set undofile
set undodir=~/.vim/undo

" scrolling {{{1
set nowrap
"set scrolloff=5
"set sidescroll=1
"set sidescrolloff=5

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
set statusline=%<%f\ %y%{GetEncoding()}%m%h%w%r%=%-14.(%l,%c%V%)\ %P

" show unprintable characters {{{1
set list
set listchars=extends:$,precedes:$,tab:»·,trail:·
set showbreak=+++

" syntax {{{1
syntax enable
filetype plugin indent on

" colorscheme {{{1
colorscheme molokai

" misc {{{1
let loaded_matchparen=1 " don't highlight matching parens
let NERDTreeWinSize=40
let g:tagbar_width=40

" keybindings {{{1
imap <silent> <F5>  <ESC>:bp<CR>
nmap <silent> <F5>  <ESC>:bp<CR>
imap <silent> <F6>  <ESC>:bn<CR>
nmap <silent> <F6>  <ESC>:bn<CR>
imap <silent> <F7>  <ESC><C-W>w
nmap <silent> <F7>  <ESC><C-W>w
imap <silent> <F8>  <ESC><C-W>W
nmap <silent> <F8>  <ESC><C-W>W
imap <silent> <F9>  <ESC>:TagbarToggle<CR>
nmap <silent> <F9>  <ESC>:TagbarToggle<CR>
imap <silent> <F10> <ESC>:NERDTreeToggle<CR>
nmap <silent> <F10> <ESC>:NERDTreeToggle<CR>
