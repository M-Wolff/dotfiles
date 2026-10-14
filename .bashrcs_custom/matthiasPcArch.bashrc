# Created by `pipx` on 2025-10-07 21:54:21
export PATH="$PATH:/home/matthias/.local/bin"
# GHCi Haskell
[ -f "/home/matthias/.ghcup/env" ] && . "/home/matthias/.ghcup/env" # ghcup-env
# opencode
export PATH=/home/matthias/.opencode/bin:$PATH


# load WoL script (contains alias definitions)
WOL_SCRIPT="/home/matthias/tools/WoL.sh"
if [ -f "$WOL_SCRIPT" ]; then
    .  "$WOL_SCRIPT"
fi

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
############################# load custom aliases ##############################
source ~/.bash_aliases_custom/matthiasPcArch.bash_aliases
