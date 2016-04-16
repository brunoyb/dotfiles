if which ruby 1>&- 2>&- && which gem 1>&- 2>&-
then
	PATH="$(ruby -rubygems -e 'puts Gem.user_dir')/bin:$PATH"
fi

[ -d "$HOME/.local/bin" ] && PATH="$HOME/.local/bin:$PATH"
[ -d "$HOME/opt/android-sdk/tools" ] && PATH="$HOME/opt/android-sdk/tools:$PATH"
[ -d "$HOME/opt/android-sdk/platform-tools" ] && PATH="$HOME/opt/android-sdk/platform-tools:$PATH"
[ -d "$HOME/bin" ] && PATH="$HOME/bin:$PATH"

export PATH

export JAVA7_HOME="/usr/lib/jvm/java-7-jdk"
export JAVA8_HOME="/usr/lib/jvm/java-8-jdk"
