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

# UliPC
#alias borgbackup="borg create --stats --progress --compression lz4 --exclude-from ~/.config/borg/excludes.txt borguser@matthiasPC:/home/borguser/borg-repos/UliPC::UliPC-{now} /home/uli/"

#IngridLaptop
#alias borgbackup='borg create --stats --progress --compression lz4 --exclude-from /home/ingrid/.config/borg/excludes.txt borguser@matthiasPC:/home/borguser/borg-repos/IngridLaptop::IngridLaptop-{now} /home/ingrid/'

