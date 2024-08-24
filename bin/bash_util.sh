#!/bin/bash

# Here all my re-usable bash functions
# If you want to use on another bash script simply do the following:
# source ~/dot/bin/bash_util.sh
# then run the function normally as pause_for_user

# Ask the enter before continue to the next section of the script
pause_for_user() {
    echo
    echo -e "\e[1;36m----------------------------------------\e[0m"
    read -p $'\e[1;33mPress Enter to continue to the next part\e[0m'
    echo -e "\e[1;36m----------------------------------------\e[0m"
    echo
}
