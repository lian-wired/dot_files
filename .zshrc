# Set up the prompt

export R_HOME=/usr/lib/R/
export GOPATH=/home/lain/GOLANG
autoload -Uz promptinit
setopt prompt_subst
promptinit
prompt adam1

REPORTTIME=5 # 30秒以上かかるコマンドは時間を表示

function str_with_color() {
    echo "%{$fg[$1]%}$2%{$reset_color%}"
}

setopt histignorealldups sharehistory EXTENDED_HISTORY
unsetopt promptcr

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e

# Keep 10000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history

GIT_STATUS=$(str_with_color red '%1(v|%F{red}%1v%f%F{yellow}%2v%f|)')


# Use modern completion system
autoload -Uz compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias less='less -N'
alias pstart='bundle exec padrino start'
alias be='bundle exec'
alias efs='emacs -fs'
alias bi='bundle install --path ~/vendor/bundle/'
alias be='bundle exec'
alias ru='bundle exec rackup config.ru'
alias gspsp='git stash; git pull; git stash pop'
alias gap='git add -p'
alias gcm='git commit -m'
alias gop='gnome-open'
alias node='nodejs'
alias remake_db='bundle exec rake db:drop; bundle exec rake db:setup; bundle exec rake db:seed_fu'
### Added by the Heroku Toolbelt

# C-dでTerminalを終了させない
setopt ignoreeof

rescueTimeIsAlive=`ps -ef | grep -cP "rescuetime$"`
if [ 1  -gt $rescueTimeIsAlive ] ;then
    rescuetime &
fi

export ANSIBLE_NOCOWS=1

export JAVA_HOME="/etc/alternatives/jre"
export EC2_HOME="$HOME/ec2-api-tools"
export AWS_KEY_FILE="$HOME/.aws-access.key"
[ -f "${AWS_KEY_FILE}" ] && source ${AWS_KEY_FILE}
export PATH="$PATH:$JAVA_HOME/bin:$EC2_HOME/bin"
export PATH="$PATH:/usr/share/doc/git/contrib/diff-highlight"

# PROMPT='$PROMPT ${GIT_STATUS}'
