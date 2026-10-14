# .bashrc additions for work PC "Wolffgang
alias todo="vim ~/Sciebo/ToDos.md"
alias shutdown='for i in {15..1}; do sleep 1 && echo "Shutting down in $i Seconds!"; done && sudo shutdown now'
alias reboot='for i in {15..1}; do sleep 1 && echo "Rebooting in $i Seconds!"; done && sudo reboot'
alias nvim='/home/m_wolf37/.local/bin/neovim/nvim-linux-x86_64/bin/nvim'
alias vim='nvim'
alias opencode='TMPDIR=/home/m_wolf37/.tmp/ opencode'
