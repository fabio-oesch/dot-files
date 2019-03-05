# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
export TERM=xterm-256color

machine=$(uname -v)

# Theme
if [[ "$machine" =~ "Ubuntu" ]]; then
  ZSH_THEME="junkfood"
else
  ZSH_THEME="spaceship"
  SPACESHIP_BATTERY_SHOW=always
fi


# Plugins
plugins=(
  git
)

# vi-mode remove vi mode for the time being

# reduce lag when switching mode
export KEYTIMEOUT=1

# reload oh my zsh
source $ZSH/oh-my-zsh.sh

export EDITOR=/usr/bin/vim
export XDG_CONFIG_HOME=~/.config
export LC_CTYPE="en_GB.UTF-8"
export LC_ALL="en_GB.UTF-8"

# Go variables
export GOROOT=/usr/lib/go
export GOPATH=~/dev/Go
export PATH=$PATH:$GOROOT/bin
export PATH=$PATH:$GOPATH/bin

# Haskell variables
export PATH=$PATH:~/.cabal/bin

eval $(thefuck --alias fuck)
eval $(keychain --eval id_rsa)

# Aliases
alias lyp='cd ~/dev/Go/src/github.com/RHUL-CS-Projects/FulUnit_1819_FabioOesch/'
alias holloway='cd ~/Documents/Dropbox/Uni/Holloway/'

# This is the same functionality as fzf's ctrl-t, except that the file or
# directory selected is now automatically cd'ed or opened, respectively.
fzf-open-file-or-dir() {
  local cmd="command find -L . \
    \\( -path '*/\\.*' -o -fstype 'dev' -o -fstype 'proc' \\) -prune \
    -o -type f -print \
    -o -type d -print \
    -o -type l -print 2> /dev/null | sed 1d | cut -b3-"
  local out=$(eval $cmd | fzf-tmux --exit-0)

  if [ -f "$out" ]; then
    $EDITOR "$out" < /dev/tty
  elif [ -d "$out" ]; then
    cd "$out"
    zle reset-prompt
  fi
}
zle     -N   fzf-open-file-or-dir
bindkey '^P' fzf-open-file-or-dir
