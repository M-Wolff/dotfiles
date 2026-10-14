# Command for drivehealth
alias drivehealth='sudo whoami >> /dev/null && parallel sudo smartctl -H /dev/{} ::: sda sdb'
alias todo="vim ~/Sciebo/ToDos.md"
