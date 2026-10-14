# Python aliases for ease of use
alias pip='pip3'
alias python='python3'
alias py='python3'
# make rm less dangerous
alias rm='rm -I'
# alias for dotfiles git
alias dotfiles='git --git-dir=$HOME/.dotfiles --work-tree=$HOME'
# alias to enforce neovim
alias vim='nvim'
# reflector update
alias reflector_update="sudo reflector \
  --country DE \
  --latest 10 \
  --protocol https \
  --sort rate \
  --save /etc/pacman.d/mirrorlist"
