#!/bin/bash
work_path=$(echo -e `pwd`)
if [ ! -f /usr/local/bin/fishing ]; then
    echo "You are want to install 'console-fishing' to /usr/local/bin"
    select opt in "Yes" "No"; 
    do
        case $opt in 
            "Yes")
                sudo cp ${work_path}/fishing /usr/local/bin && echo -e "Script installes"
                exit 0
                ;;
            "No")
                exit 0
                ;;
        esac
    done
else
    echo "Script is already installed"
fi