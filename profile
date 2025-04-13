EDITOR=vim
GOPATH="$HOME/go"

[ -d "/usr/local/opt/ruby/bin" ] && PATH="/usr/local/opt/ruby/bin:$PATH"

if command -v ruby > /dev/null 2>&1 && command -v gem > /dev/null 2>&1; then
	PATH="$(ruby -r rubygems -e 'puts Gem.dir')/bin:$PATH"
	PATH="$(ruby -r rubygems -e 'puts Gem.user_dir')/bin:$PATH"
fi

if [ -x /opt/homebrew/bin/brew ]; then
	eval "$(/opt/homebrew/bin/brew shellenv)"

	[ -d "/opt/homebrew/opt/coreutils/libexec/gnubin" ] && PATH="/opt/homebrew/opt/coreutils/libexec/gnubin:$PATH"

	if [ -d /opt/homebrew/etc/profile.d ]; then
		for f in /opt/homebrew/etc/profile.d/*.sh; do
			[ -r "$f" ] && . "$f"
		done
		unset f
	fi

	[ -r "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"
fi

[ -d "$HOME/Library/Python/2.7/bin" ] && PATH="$HOME/Library/Python/2.7/bin:$PATH"
[ -d "$HOME/Library/Python/3.7/bin" ] && PATH="$HOME/Library/Python/3.7/bin:$PATH"
[ -d "/usr/local/opt/go/libexec/bin" ] && PATH="/usr/local/opt/go/libexec/bin:$PATH"
[ -d "$GOPATH/bin" ] && PATH="$GOPATH/bin:$PATH"
[ -d "$HOME/.cabal/bin" ] && PATH="$HOME/.cabal/bin:$PATH"
[ -d "$HOME/.ghcup/bin" ] && PATH="$HOME/.ghcup/bin:$PATH"
[ -d "$HOME/.local/bin" ] && PATH="$HOME/.local/bin:$PATH"
[ -d "$HOME/.rd/bin" ] && PATH="$HOME/.rd/bin:$PATH"
[ -d "$HOME/.tfenv/bin" ] && PATH="$HOME/.tfenv/bin:$PATH"
[ -d "$HOME/bin" ] && PATH="$HOME/bin:$PATH"

export EDITOR GOPATH PATH
