if [ -f ~/.profile ]; then
	. ~/.profile
fi

if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

if [ -f ~/.bash_local ]; then
	. ~/.bash_local
fi
