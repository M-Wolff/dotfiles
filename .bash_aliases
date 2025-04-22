# Python aliases for ease of use
alias pip='pip3'
alias python='python3'
alias py='python3'
# Delayed shutdown & auto alias for sudo
alias shutdown='for i in {15..1}; do sleep 1 && echo "Shutting down in $i Seconds!"; done && sudo shutdown now'
# make rm less dangerous
alias rm='rm -I'
# ToDo list
alias todo="vim ~/Sciebo/ToDos.md"
alias todos=todo
# alias for dotfiles git
alias dotfiles='git --git-dir=$HOME/.dotfiles --work-tree=$HOME'

