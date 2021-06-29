#!/bin/bash
if [ ! -f /usr/local/bin/fishing ]; then
    echo "Script not found. Dont installed or was been removed"
else
    echo "You are want to REMOVE 'console-fishing'"
    select opt in "Yes" "No"; 
    do
        case $opt in 
            "Yes")
                sudo rm -rf /usr/local/bin/fishing && echo -e "Script removed"
                exit 0
                ;;
            "No")
                exit 0
                ;;
        esac
    done
fi