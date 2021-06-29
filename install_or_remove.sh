#!/bin/bash
#PATH
install_path="/usr/local/bin"

function version { echo "$@" | awk -F. '{ printf("%d%03d%03d%03d\n", $1,$2,$3,$4); }'; }

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
fi

echo "How to Update:"
    select opt in "Local" "GitHub"; 
    do
        case $opt in 
            "Local")
                work_path=$(echo -e `pwd`)
                echo $work_path
                break
                ;;
            "GitHub")
                if [ -d ~/Templates/console-fishing/ ]; then 
                    rm -rf ~/Templates/console-fishing
                    git clone https://github.com/redian23/console-fishing.git ~/Templates/console-fishing && cd ~/Templates/console-fishing 
                    work_path=$(echo -e `pwd`)
                else
                    git clone https://github.com/redian23/console-fishing.git ~/Templates/console-fishing && cd ~/Templates/console-fishing
                    work_path=$(echo -e `pwd`)
                fi
                break
                ;;
        esac
    done

echo -e "Please wait few second. Scaning versions..."
new_version=`${work_path}/fishing | grep -m 1 Version | cut -c 14-19`
current_version=`${install_path}/fishing | grep -m 1 Version | cut -c 14-19`

echo -e "New version-> "$new_version
echo -e "Current ver-> "$current_version

stty echo
if [ $(version $current_version) -ge $(version $new_version) ]; then
    echo "Version is up to date"
    exit 0
else
    echo "Need update"
    select opt in "Yes" "No"; 
    do
        case $opt in 
            "Yes")
                sudo cp ${work_path}/fishing /usr/local/bin && echo -e "Script updated"
                exit 0
                ;;
            "No")
                break
                ;;
        esac
    done
fi

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

