# Python aliases for ease of use
alias pip='pip3'
alias python='python3'
alias py='python3'
# make rm less dangerous
alias rm='rm -I'
# alias for dotfiles git
alias dotfiles='git --git-dir=$HOME/.dotfiles --work-tree=$HOME'
# Backup Aliases
alias borgbackup_SyncThing='borg create --compression lz4 --stats --progress --exclude-from ~/.config/borg/excludes_SyncThing.txt /mnt/external_elements_hdd/borg-repos/MatthiasPC_SyncThing/::MatthiasPC_SyncThing-{now} /home/matthias/SyncThing/'
alias borgbackup_home='borg create --compression lz4 --stats --progress --exclude-from ~/.config/borg/excludes_home.txt /mnt/external_elements_hdd/borg-repos/MatthiasPC_home/::MatthiasPC_home-{now} /home/matthias /mnt/ssd_nvme/.minecraft'
alias borgbackup_internalHDD='borg create --compression lz4 --stats --progress --exclude-from ~/.config/borg/excludes_internalHDD.txt /mnt/external_elements_hdd/borg-repos/MatthiasPC_internalHDD/::MatthiasPC_internalHDD-{now} /mnt/hdd'
