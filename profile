GOPATH="$HOME/My/Code/go"

[ -d "$HOME/opt/android-sdk/tools" ] && PATH="$HOME/opt/android-sdk/tools:$PATH"
[ -d "$HOME/opt/android-sdk/platform-tools" ] && PATH="$HOME/opt/android-sdk/platform-tools:$PATH"
[ -d "$HOME/Library/Python/2.7/bin" ] && PATH="$HOME/Library/Python/2.7/bin:$PATH"
[ -d "$HOME/Library/Python/3.7/bin" ] && PATH="$HOME/Library/Python/3.7/bin:$PATH"
[ -d "/usr/local/opt/go/libexec/bin" ] && PATH="/usr/local/opt/go/libexec/bin:$PATH"
[ -d "/usr/local/opt/ruby/bin" ] && PATH="/usr/local/opt/ruby/bin:$PATH"
[ -d "$GOPATH/bin" ] && PATH="$GOPATH/bin:$PATH"
[ -d "$HOME/.local/bin" ] && PATH="$HOME/.local/bin:$PATH"
[ -d "$HOME/bin" ] && PATH="$HOME/bin:$PATH"

export GOPATH PATH
