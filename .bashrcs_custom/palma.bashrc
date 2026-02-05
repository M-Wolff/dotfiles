#! /usr/bin/env bash

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions
HOSTNAME=`hostname`
if [ "$SSH_TTY" ]; then  # only execute following block on a shell connection (avoid breaking SFTP stuff)
#    if [ ${HOSTNAME} == "r07m01" ]; then  # only execute these commands on the head-node (vim and some modules not available on compute nodes)
        # Whatever only should run on login node
#   fi
    alias v="vim"
    alias nano="vim"
    #alias sq="squeue -O 'JobId:12 | ,Partition:.9 | ,Username:8 | ,Name:16 | ,State:.7 | ,TimeUsed:.11 | ,TimeLeft:.11 | ,MaxCPUs:.5 | ,MinMemory:.10 | ,tres-per-node:13 | ,Reason:8 | ,Nodelist:8 | ,Prioritylong'"
    alias sq="squeue -o '%.10i | %.9P | %.8u | %.8Q | %.33j | %.7T | %.11M | %.11L | %.5C | %.10m | %.13b | %.12R'"
fi
