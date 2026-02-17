# Command for drivehealth
alias drivehealth='sudo whoami >> /dev/null && parallel sudo smartctl -H /dev/{} ::: sda sdb'
alias todo="vim ~/Sciebo/ToDos.md"

###################### Start ssh-agent once and reuse it #######################
SSH_ENV="$HOME/.ssh/agent.env"

[ -f "/home/matthias/.ghcup/env" ] && . "/home/matthias/.ghcup/env" # ghcup-env

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
