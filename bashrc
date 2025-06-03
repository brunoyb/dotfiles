[[ $- != *i* ]] && return

# general {{{1
HISTCONTROL=ignoreboth
HISTSIZE=10000
PROMPT_DIRTRIM=3
PS1='\[\e[1;37m\][\[\e[1;32m\]\u\[\e[1;37m\]@\[\e[1;32m\]\h\[\e[1;37m\]:\[\e[1;34m\]\w\[\e[1;37m\]]\[\e[1;32m\]\$\[\e[0m\] '

# aliases {{{1
alias chgrp='chgrp --preserve-root'
alias chmod='chmod --preserve-root'
alias chown='chown --preserve-root'
alias cp='cp --interactive'
alias grep='grep --color=auto'
alias ln='ln --interactive'
alias mv='mv --interactive'
alias rm='rm --interactive=once'

# ls {{{2
alias l.='ls --color=auto --group-directories-first --directory .*'
alias la='ls --color=auto --group-directories-first --all'
alias ll='ls --color=auto --group-directories-first --human-readable -l'
alias ls='ls --color=auto --group-directories-first'

# functions {{{1
function    calc() { awk "BEGIN { print $* }"; }
function dec2hex() { awk "BEGIN { printf \"%x\n\",   $1 }"; }
function hex2dec() { awk "BEGIN { printf \"%d\n\", 0x$1 }"; }

# keychain {{{1
if command -v keychain > /dev/null 2>&1; then
	eval "$(keychain --eval --ignore-missing --quiet id_ed25519 id_rsa)"
fi

# local {{{1
if [ -f ~/.bashrc_local ]; then
	. ~/.bashrc_local
fi
