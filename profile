case "$OSTYPE" in
darwin*)
	export GOROOT="$(brew --prefix golang)/libexec"
	export GOPATH="$HOME/My/Code/go"
	export PATH="$GOPATH/bin:$GOROOT/bin:$PATH"

	;;
esac

[ -d "$HOME/opt/android-sdk/tools" ] && PATH="$HOME/opt/android-sdk/tools:$PATH"
[ -d "$HOME/opt/android-sdk/platform-tools" ] && PATH="$HOME/opt/android-sdk/platform-tools:$PATH"
[ -d "$HOME/Library/Python/2.7/bin" ] && PATH="$HOME/Library/Python/2.7/bin:$PATH"
[ -d "$HOME/Library/Python/3.7/bin" ] && PATH="$HOME/Library/Python/3.7/bin:$PATH"
[ -d "$HOME/.local/bin" ] && PATH="$HOME/.local/bin:$PATH"
[ -d "$HOME/bin" ] && PATH="$HOME/bin:$PATH"

export PATH
