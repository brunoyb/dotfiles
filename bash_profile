if [ -f ~/.profile ]; then
	. ~/.profile
fi

if [ -f ~/.profile_local ]; then
	. ~/.profile_local
fi

if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

if [ -f ~/.bashrc_local ]; then
	. ~/.bashrc_local
fi
