if [[ $- != *i* ]]; then
	return # Shell is non-interactive. Be done now!
fi

# general {{{1
export EDITOR=vim
export HISTCONTROL=ignoreboth
export HISTSIZE=1000
export HISTFILESIZE=2000

shopt -s histappend
shopt -s checkwinsize

# aliases {{{1
alias chgrp='chgrp --preserve-root'
alias chmod='chmod --preserve-root'
alias chown='chown --preserve-root'
alias cp='cp --interactive'
alias ln='ln --interactive'
alias ls='ls --color=auto --group-directories-first'
alias mv='mv --interactive'
alias rm='rm --interactive=once'

# ls {{{2
alias la='ls -a'
alias lal='la -lh'
alias ll='ls -lh'
alias lla='ll -a'
alias lt='ll -tr'
alias lz='ll -Sr'

# misc {{{2
alias grep='grep --color=auto'
alias tsync='rsync -avz --delete-after'

# dircolors {{{1
if command -v dircolors >/dev/null 2>&1
then
	if [ -f "$HOME/.dircolors" ]
	then
		eval $(dircolors --bourne-shell "$HOME/.dircolors")
	else
		eval $(dircolors --bourne-shell)
	fi
fi

# keychain {{{1
if command -v keychain >/dev/null 2>&1
then
	eval $(keychain --eval --agents ssh --inherit any --quick --quiet id_ed25519 id_rsa)
fi

# functions {{{1
function    calc() { awk "BEGIN { print $* }"; }
function dec2hex() { awk "BEGIN { printf \"%x\n\",   $1 }"; }
function hex2dec() { awk "BEGIN { printf \"%d\n\", 0x$1 }"; }

# prompt {{{1
function bash_prompt()
{
	local RV="$?" # get last return value

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
	if [ "$UID" -eq 0 ]
	then
		local UC="$BR"
	else
		local UC="$BG"
	fi

	# return value {{{2
	if [ "$RV" -eq 0 ]
	then
		local RV=""
	else
		local RV="${BW}[${BM}${RV}${BW}]"
	fi

	# }}}2

	echo -n "${BW}[${UC}\u${BW}@${UC}\h${BW}:${BB}\w${BW}][${UC}${SHLVL}${BW}]${RV}${UC}"'\$'"${NONE} "
}

PROMPT_COMMAND='PS1="$(bash_prompt)"; '"$PROMPT_COMMAND"
PROMPT_DIRTRIM=3
