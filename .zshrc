# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/home/olearry/.oh-my-zsh
export TERM=xterm-256color

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
POWERLEVEL9K_MODE='nerdfont-complete'
ZSH_THEME="powerlevel9k/powerlevel9k"

# ---------- atomiccodings config -------------
prompt_zsh_battery_level() {
    local percentage=`upower -i $(upower -e | grep 'BAT') | awk '$1=="percentage:" {print $2}'`
    percentage=${percentage%?};
    local color='%F{009}'
    local symbol="\uf00d"
    if [ $percentage -lt 25 ] ;
        then symbol="\uf244" ; color='%F{009}' ;
        #Less than 25
    fi
    if [ $percentage -ge 25 ] ;
        then symbol='\uf243' ; color='%F{009}' ;
    #25%
    fi
    if [ $percentage -ge 50 ] ;
         then symbol="\uf242" ; color='%F{011}' ;
     #50%
     fi
    if [ $percentage -ge 75 ] ;
        then symbol="\uf241" ; color='%F{012}' ;
        #75%
    fi
    if [ $percentage -ge 99 ] ;
        then symbol="\uf240" ; color='%F{010}' ;
        #100%
    fi
    upower -i $(upower -e | grep 'BAT') | grep "discharging" >& /dev/null
    if [ $? -eq 0 ]; then
        true;
    else
        symbol="\uf1e6";
    fi
    echo -n "%{$color%}$symbol "
}

prompt_zsh_battery() {
    local bat=`upower -i $(upower -e | grep 'BAT') | awk '$1=="percentage:" {print $2}'`
    local bat1=`upower -i $(upower -e | grep 'BAT1') | awk '$1=="percentage:" {print $2}'`

    upower -i $(upower -e | grep 'BAT') | grep "state:" | grep "discharging" >& /dev/null || upower -i $(upower -e | grep 'BAT1') | grep "state:" | grep "discharging" >& /dev/null
    if [ $? -eq 0 ]; then
        symbol="\uf242";
    else
        symbol="\uf1e6";
    fi
    percent="\uf295";
    echo "$symbol $bat%%  $bat1%% "
}




zsh_internet_signal() {
    local signal=`nmcli -f ACTIVE,SIGNAL dev wifi list | awk '$1=="yes" {print $2}'`
    local SNR=$signal

    local net=$(curl -D- -o /dev/null -s http://www.google.com | grep HTTP/1.1 | awk '{print $2}')
    local color='%F{011}'
    local symbol="\uf197"

    # No Signal - No Internet
    if [[ ! -z "$signal" ]] && [[ $signal -lt 10 ]] ;
        then color='%F{009}' ; symbol="\uf011";
    fi

    # Very Low Signal (1 bar)
    if [[ ! -z "$signal" ]] && [[ $signal -ge 10 ]] ;
        then color='%F{009}' ; symbol="\uf1eb" ;
    fi

    # Low Signal (2 bars)
    if [[ ! -z "$signal" ]] && [[ $signal -gt 25 ]] ;
        then color='%F{011}' ; symbol="\uf1eb" ;
    fi

    # Good Signal (3-4 bars)
    if [[ ! -z "$signal" ]] && [[ $signal -gt 50 ]] ;
        then color='%F{010}' ; symbol="\uf1eb" ;
    fi

    # Excellent Signal (5 bars)
    if [[ ! -z "$signal" ]] && [[ $signal -gt 75 ]] ;
        then color='%F{012}' ; symbol="\uf1eb" ;
    fi

    if [[ -z "$signal" ]] && [[ "$net" -ne 200 ]] ;
        then color='%F{009}' ; symbol="\uf011" ;
    fi

    # Ethernet Connection (no wifi, hardline)
    if [[ -z "$signal" ]] && [[ "$net" -eq 200 ]] ;
        then color='%F{012}' ; symbol="\uf197" ;
    fi

    echo -n "%{$color%}$symbol " # \f1eb is wifi bars
}

POWERLEVEL9K_OS_ICON_FOREGROUND="255"
POWERLEVEL9K_OS_ICON_BACKGROUND="241"
#POWERLEVEL9K_PROMPT_ON_NEWLINE=true
#POWERLEVEL9K_PROMPT_ADD_NEWLINE=true
#POWERLEVEL9K_RPROMPT_ON_NEWLINE=true
POWERLEVEL9K_SHORTEN_DIR_LENGTH=2
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_beginning"
POWERLEVEL9K_RVM_BACKGROUND="black"
POWERLEVEL9K_RVM_FOREGROUND="249"
POWERLEVEL9K_RVM_VISUAL_IDENTIFIER_COLOR="red"
POWERLEVEL9K_TIME_BACKGROUND="246"
POWERLEVEL9K_TIME_FOREGROUND="black"
POWERLEVEL9K_TIME_FORMAT="%D{%H:%M \UF133 %m.%d.%y}"
POWERLEVEL9K_RVM_BACKGROUND="black"
POWERLEVEL9K_RVM_FOREGROUND="249"
POWERLEVEL9K_RVM_VISUAL_IDENTIFIER_COLOR="red"
POWERLEVEL9K_STATUS_VERBOSE=false
POWERLEVEL9k_VCS_BACKGROUND='166'
POWERLEVEL9K_VCS_CLEAN_FOREGROUND='black'
POWERLEVEL9K_VCS_CLEAN_BACKGROUND='green'
POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND='black'
POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND='yellow'
POWERLEVEL9K_VCS_MODIFIED_FOREGROUND='black'
POWERLEVEL9K_VCS_MODIFIED_BACKGROUND='yellow'
POWERLEVEL9K_COMMAND_EXECUTION_TIME_BACKGROUND='black'
POWERLEVEL9K_COMMAND_EXECUTION_TIME_FOREGROUND='blue'
POWERLEVEL9K_FOLDER_ICON=''
POWERLEVEL9K_STATUS_OK_IN_NON_VERBOSE=true
POWERLEVEL9K_STATUS_VERBOSE=false
POWERLEVEL9K_COMMAND_EXECUTION_TIME_THRESHOLD=0
POWERLEVEL9K_VCS_UNTRACKED_ICON='\u25CF'
POWERLEVEL9K_VCS_UNSTAGED_ICON='\u00b1'
POWERLEVEL9K_VCS_INCOMING_CHANGES_ICON='\u2193'
POWERLEVEL9K_VCS_OUTGOING_CHANGES_ICON='\u2191'
POWERLEVEL9K_VCS_COMMIT_ICON="\uf417"
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX="" #%F{blue}\u256D\u2500%F{255}"
POWERLEVEL9K_MULTILINE_SECOND_PROMPT_PREFIX="$ " #%F{white}\u2570\uf460%F{255} "
POWERLEVEL9K_CUSTOM_INTERNET_SIGNAL="zsh_internet_signal"
POWERLEVEL9K_CUSTOM_INTERNET_SIGNAL_BACKGROUND="241"
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon ssh root_indicator dir dir_writable vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status time custom_internet_signal zsh_battery)
HIST_STAMPS="mm/dd/yyyy"
DISABLE_UPDATE_PROMPT=true
# ---------- end config -------------
# ZSH_THEME="agnoster"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
#plugins=(archlinux git command-not-found common-aliases lol vi-mode)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

export EDITOR=/usr/bin/vim
export XDG_CONFIG_HOME=~/.config
export PATH=$PATH:/home/olearry/.gem/ruby/2.4.0/bin
export LC_CTYPE="en_GB.UTF-8"
export LC_ALL="en_GB.UTF-8"

eval $(thefuck --alias fuck)

alias mutt='mutt -F .config/mutt/.muttrc'
alias droplatex='cd ~/Documents/Dropbox/Latex/Holloway/'
alias dropuni='cd ~/Documents/Dropbox/Uni/Holloway/'
alias unissh='ssh zdac124@teaching.cim.rhul.ac.uk'
alias univpn='f5fpc -s -t webvpn.rhul.ac.uk -x -u zdac124'
alias pip3install='pip install lxml --user'
alias unidb='ssh zdac124@teaching.cim.rhul.ac.uk -L 5432:teachdb:5432'
alias unipsql='psql -h localhost CS2855/zdac124 -U zdac124'
alias umlet='java -jar ~/Documents/software/Umlet/umlet.jar'
alias digitaloceanssh='ssh root@165.227.232.65'


# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
