if which ruby 1>&- 2>&- && which gem 1>&- 2>&-
then
	PATH="$(ruby -rubygems -e 'puts Gem.user_dir')/bin:$PATH"
fi

PATH="$HOME/bin:$HOME/.local/bin:$PATH"

export PATH
