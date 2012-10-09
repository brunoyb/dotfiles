[[ $- != *i* ]] && return # if not running interactively, don't do anything

# environment {{{1
export EDITOR=vim
export HISTCONTROL=ignoreboth
export HISTSIZE=1000
export HISTFILESIZE=2000

# shopt {{{1
shopt -s histappend
shopt -s checkwinsize

# term colors {{{1
case "$TERM" in
linux)
	# black
	echo -en "\e]P0000000"
	echo -en "\e]P86A6A6A"
	# red
	echo -en "\e]P1E01010"
	echo -en "\e]P9E83A3D"
	# green
	echo -en "\e]P220AD20"
	echo -en "\e]PA35E956"
	# yellow
	echo -en "\e]P3D4C24F"
	echo -en "\e]PBFFFF2F"
	# blue
	echo -en "\e]P4231BB8"
	echo -en "\e]PC3A53F0"
	# magenta
	echo -en "\e]P59C3885"
	echo -en "\e]PDE628BA"
	# cyan
	echo -en "\e]P61DBDB8"
	echo -en "\e]PE1CF5F5"
	# white
	echo -en "\e]P7FEFEFE"
	echo -en "\e]PFFFFFFF"

	clear # for background artifacting

	;;
xterm)
	[ "$COLORTERM" == gnome-terminal ] && TERM=xterm-256color

	;;
screen)
	[ "$COLORTERM" == gnome-terminal ] && TERM=screen-256color

	;;
esac

# keychain {{{1
if [ -x /usr/bin/keychain ]
then
	eval $(keychain --eval --nogui --quick --quiet id_rsa)
fi

# dircolors {{{1
if [ -x /bin/dircolors ]
then
	if [ -f "$HOME/.dircolors" ]
	then
		eval $(dircolors -b "$HOME/.dircolors")
	else
		eval $(dircolors -b)
	fi
fi

# lesspipe {{{1
[ -x /usr/bin/lesspipe ] && eval $(SHELL=/bin/sh lesspipe)

# aliases {{{1
[[ -f ~/.bash_aliases ]] && . ~/.bash_aliases

# ls {{{2
alias la='ls -a'
alias lal='la -lh'
alias ll='ls -lh'
alias lla='ll -a'
alias ls='ls --color=auto --group-directories-first'
alias lt='ll -tr'
alias lz='ll -Sr'

# safety {{{2
alias chgrp='chgrp --preserve-root'
alias chmod='chmod --preserve-root'
alias chown='chown --preserve-root'
alias cp='cp -i'
alias ln='ln -i'
alias mv='mv -i'
alias rm='rm -I'

# misc {{{2
alias g='gvim --remote-silent'
alias grep='grep --color=auto'
alias tsync='rsync -avz --delete-after'

# functions {{{1
function    calc() { awk "BEGIN { print $* }"; }
function dec2hex() { awk "BEGIN { printf \"%x\n\",   $1 }"; }
function hex2dec() { awk "BEGIN { printf \"%d\n\", 0x$1 }"; }

# prompt {{{1
function bash_prompt()
{
	local RV=$? # get last return value

	# default fg color {{{2
	local NONE='\[\e[0m\]'

	# normal colors {{{2
	local NK='\[\e[0;30m\]' # black
	local NR='\[\e[0;31m\]' # red
	local NG='\[\e[0;32m\]' # green
	local NY='\[\e[0;33m\]' # yellow
	local NB='\[\e[0;34m\]' # blue
	local NM='\[\e[0;35m\]' # magenta
	local NC='\[\e[0;36m\]' # cyan
	local NW='\[\e[0;37m\]' # white

	# bright colors {{{2
	local BK='\[\e[1;30m\]'
	local BR='\[\e[1;31m\]'
	local BG='\[\e[1;32m\]'
	local BY='\[\e[1;33m\]'
	local BB='\[\e[1;34m\]'
	local BM='\[\e[1;35m\]'
	local BC='\[\e[1;36m\]'
	local BW='\[\e[1;37m\]'

	# background colors {{{2
	local BGK='\[\e[40m\]'
	local BGR='\[\e[41m\]'
	local BGG='\[\e[42m\]'
	local BGY='\[\e[43m\]'
	local BGB='\[\e[44m\]'
	local BGM='\[\e[45m\]'
	local BGC='\[\e[46m\]'
	local BGW='\[\e[47m\]'

	# user color {{{2
	if [ $UID -eq 0 ]
	then
		local UC=$BR
	else
		local UC=$BG
	fi

	# return value {{{2
	if [ $RV -eq 0 ]
	then
		local RV=""
	else
		local RV="${BW}[${BR}${RV}${BW}]"
	fi

	# }}}2

	echo -n "${BW}[${UC}\u${BW}@${UC}\h${BW}:${BB}\w${BW}]${RV}${UC}"'\$'"${NONE} "
}

PROMPT_COMMAND='PS1=$(bash_prompt); '"$PROMPT_COMMAND"
PROMPT_DIRTRIM=3
