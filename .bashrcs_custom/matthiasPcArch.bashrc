# Created by `pipx` on 2025-10-07 21:54:21
export PATH="$PATH:/home/matthias/.local/bin"

alias vim='nvim'
# Command for drivehealth
alias drivehealth='sudo whoami >> /dev/null && parallel sudo smartctl -H /dev/{} ::: nvme0 nvme1 nvme2 sda sdb'
alias drivestats='sudo smartctl -a'
alias todo='vim ~/Schreibtisch/todo.txt'
alias unitodo="vim ~/Sciebo/Uni-Muenster-Sciebo/ToDos.md"
alias reflector_update="sudo reflector \
  --country DE \
  --latest 10 \
  --protocol https \
  --sort rate \
  --save /etc/pacman.d/mirrorlist"

###################### Start ssh-agent once and reuse it #######################
SSH_ENV="$HOME/.ssh/agent.env"

function start_agent {
    echo "Starting new SSH agent..."
    (umask 077; ssh-agent > "$SSH_ENV")
    . "$SSH_ENV" > /dev/null
}

# Check if SSH agent is running
if [ -f "$SSH_ENV" ]; then
    . "$SSH_ENV" > /dev/null
    if ! kill -0 "$SSH_AGENT_PID" 2>/dev/null; then
        start_agent
    fi
else
    start_agent
fi
