# emacs
isAlive=`ps -ef | grep -c "emacs\s--daemon"`
if [ 1  -gt $isAlive ] ;then
    emacs --daemon
fi
alias E='emacsclient -t'
alias kill-emacs="emacsclient -e '(kill-emacs)'"

# rbenv
PATH=$PATH:$HOME/.rbenv/bin:$HOME/local/bin:$HOME/dev/shell_script
export PATH

eval "$(rbenv init -)"
