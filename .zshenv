# emacs
isAlive=`ps -ef | grep -c "emacs\s--daemon"`
if [ 1  -gt $isAlive ] ;then
    emacs --daemon
fi
alias E='emacsclient -t'
alias kill-emacs="emacsclient -e '(kill-emacs)'"

# rbenv
PATH=$PATH:$HOME/.rbenv/bin:$HOME/local/bin:$HOME/.gem/ruby/1.8/bin
export PATH

eval "$(rbenv init -)"

# key remap
xmodmap ~/.xmodmap

