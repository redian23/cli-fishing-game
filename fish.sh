#!/bin/bash

function clear {
    echo -e '\033c'
}

source pics.sh
stty -echo

#Welcome
clear
echo -e $LOGO
echo -e "\e[32mWelcome!\e[0m" 
echo -e "You are start to play in Console Fishing"
echo -e "This is simple bash script, but to have so much fun."
echo -e "\e[33mCreated by Redian23\e[0m"
echo -e "\e[31mVersion 0.6.11 RC2\e[0m"
echo -e ""
echo -e "Advices:"
echo -e "\e[32m * For comfort play, please, open terminal on FullScreen\e[0m"
echo -e "\e[35m * Please, use <Eng> Keyboard Layout\e[0m"
echo -e "\e[33m * Looks like better on KDE (kde console)\e[0m"
sleep 5s

#------------------------------------------------------------/
#VALUES

#initialize randome borders
FLOOR=10
RANGE=100

FISH_WEIGHT=0
FISH_WEIGHT_RANGE=100

DEMO_MODE=FALSE
DEBUG_MODE=FALSE

#initialize envirement values
POSITION_INDICATOR=''
FISH_ROD_MAX_WEIGHT=0
CATCH=0
ENV=0

#Button on board
key_1=''
key_2=''
keyboard_key=''
fish_value=0

#------------------------------------------------------------/

if [[ "$1" == -d || "$1" == --debug || "$2" == -d || "$2" == --debug ]]; then
    DEBUG_MODE=TRUE
    echo -e "Debug Mode ON"
    sleep 2s
fi

if [[ "$1" == -dm || "$1" == --demo || "$2" == -dm || "$2" == --demo ]]; then
    DEMO_MODE=TRUE
    echo -e "Demo Mode ON"
    sleep 2s
fi

debug_echo(){
    if [ $DEBUG_MODE == 'TRUE' ];then 
        echo -e $CATCH!=$ENV
    fi
}

check_console_size(){
    local console_height="$(stty size | cut -c 1-3)"
    local console_width="$(stty size | cut -c 4-6)"

    if [[ "$console_height" -lt "30" || "$console_width" -lt "150" ]];then
        stty echo
        echo -e ""
        echo -e "\e[31mOpen console on fullscreen mode or resize terminal window!\e[0m"
        echo -e "\e[33mMininal window size 150x30\e[0m"
        sleep 3s
        exit 0
    fi
}

key_map_menu(){
stty echo
echo -e "Select key mapping:"
    select opt in "Key 'F'" "Key 'Space'"; 
    do
        case $opt in
        "Key 'F'")
            keyboard_key='F'
            key_1="f"   #Eng
            key_2="а"   #Rus
            echo -e "You are select ${opt}"
            sleep 1s
            break
            ;;
        "Key 'Space'")
            keyboard_key='Space'
            key_1=$'\x20'   #Space
            key_2=$'\x0a'   #Enter
            echo -e "You are select ${opt}"
            sleep 1s
            break
            ;;
        *) 
            echo "invalid option $REPLY"
            ;;
        esac
    done
}


difficulty_level_menu(){
echo -e ""
echo -e "Select difficulty level:"
    select opt in "Easy" "Medium" "Hard" "Expert"; 
    do
        case $opt in
        "Easy")
            money=350
            echo -e "You are select ${opt}"
            sleep 1s
            break
            ;;
        "Medium")
            money=200
            echo -e "You are select ${opt}"
            sleep 1s
            break
            ;;
        "Hard")
            money=50
            echo -e "You are select ${opt}"
            sleep 1s
            break
            ;;

        "Expert")
            money=1
            echo -e "You are select ${opt}"
            sleep 1s
            break
            ;;
        *) 
            echo "invalid option $REPLY"
            ;;
        esac
    done
}

fish_rod_menu(){
stty echo

clear
echo -e "\e[33mYou are have a ${money}$\e[0m"
echo "
List fish-rod's:
*  Name:                        Price:  Max Weith:
1. Stick with thread            0$      1kg;
2. Fish Liter N5;               100$;   5kg; 
3. Fish Hunter Pro M10RT;       250$;   10kg; 
4. Fish Kung Fu Master R20V;    450$;   20kg; 

Selecte Fish-rod:"

fish_rods_list=("Stick" "Fish Liter N5" "Fish Hunter Pro M10RT" "Fish Kung Fu Master R20V")
select opt in "${fish_rods_list[@]}"
do
    case $opt in
        "Stick")  
            FISH_ROD_MAX_WEIGHT=1000
            echo "You are find ownerless stick with thread"
            sleep 1s
            break
            ;;
        "Fish Liter N5")
            if [ "$money" -lt "100" ];then
                echo "You don't have a money. Sorry :("
                sleep 3s
                fish_rod_menu
            fi
            ((money-=100))       
            FISH_ROD_MAX_WEIGHT=5000
            echo "You are select Fish Liter N5; -100$"
            sleep 1s
            break
            ;;
        "Fish Hunter Pro M10RT")
            if [ "$money" -lt "250" ];then
                echo "You don't have a money. Sorry :("
                sleep 3s
                fish_rod_menu
            fi
            ((money-=250)) 
            FISH_ROD_MAX_WEIGHT=10000
            echo "You are select Fish Hunter Pro M10RT; -250$"
            sleep 1s
            break
            ;;
        "Fish Kung Fu Master R20V")
            if [ "$money" -lt "450" ];then
                echo "You don't have a money. Sorry :("
                sleep 3s
                fish_rod_menu
            fi
            ((money-=450)) 
            FISH_ROD_MAX_WEIGHT=20000
            echo "You are select Fish Kung Fu Master R20V; -450$"
            sleep 1s
            break
            ;;
        *)  
            echo "invalid option $REPLY"
            ;;
    esac
done
game
}

lake_positions(){
echo "Please enter position your bobber:"
positions=("Place 1" "Place 2" "Place 3")
select opt in "${positions[@]}"
do
    case $opt in
        "Place 1")
            FISH_WEIGHT_RANGE=4500

            WAITING_ANIMATION_1=$WAITING_ANIMATION_LAKE_POSITION1_1
            WAITING_ANIMATION_2=$WAITING_ANIMATION_LAKE_POSITION1_2
            WAITING_ANIMATION_3=$WAITING_ANIMATION_LAKE_POSITION1_3
            BITE_ANIMATION_1=$BITE_ANIMATION_LAKE_POSITION1_1
            BITE_ANIMATION_2=$BITE_ANIMATION_LAKE_POSITION1_2
            BITE_ANIMATION_3=$BITE_ANIMATION_LAKE_POSITION1_3
            
            echo "you chose place 1"
            sleep 0.5s
            break
            ;;
        "Place 2")
            FISH_WEIGHT_RANGE=5500

            WAITING_ANIMATION_1=$WAITING_ANIMATION_LAKE_POSITION2_1
            WAITING_ANIMATION_2=$WAITING_ANIMATION_LAKE_POSITION2_2
            WAITING_ANIMATION_3=$WAITING_ANIMATION_LAKE_POSITION2_3
            BITE_ANIMATION_1=$BITE_ANIMATION_LAKE_POSITION2_1
            BITE_ANIMATION_2=$BITE_ANIMATION_LAKE_POSITION2_2
            BITE_ANIMATION_3=$BITE_ANIMATION_LAKE_POSITION2_3
            
            echo "you chose place 2"
            sleep 0.5s
            break
            ;;
        "Place 3")
            FISH_WEIGHT_RANGE=6500

            WAITING_ANIMATION_1=$WAITING_ANIMATION_LAKE_POSITION3_1
            WAITING_ANIMATION_2=$WAITING_ANIMATION_LAKE_POSITION3_2
            WAITING_ANIMATION_3=$WAITING_ANIMATION_LAKE_POSITION3_3
            BITE_ANIMATION_1=$BITE_ANIMATION_LAKE_POSITION3_1
            BITE_ANIMATION_2=$BITE_ANIMATION_LAKE_POSITION3_2
            BITE_ANIMATION_3=$BITE_ANIMATION_LAKE_POSITION3_3

            echo "you chose place 3"
            sleep 0.5s
            break
            ;;
        *)  
            echo "invalid option $REPLY"
            ;;
    esac
done
}

river_positions(){
echo "Please enter position your bobber:"
positions=("Place 1" "Place 2" "Place 3")
select opt in "${positions[@]}"
do
    case $opt in
        "Place 1")
            FISH_WEIGHT_RANGE=8000

            WAITING_ANIMATION_1=$WAITING_ANIMATION_RIVER_POSITION1_1
            WAITING_ANIMATION_2=$WAITING_ANIMATION_RIVER_POSITION1_2
            WAITING_ANIMATION_3=$WAITING_ANIMATION_RIVER_POSITION1_3
            BITE_ANIMATION_1=$BITE_ANIMATION_RIVER_POSITION1_1
            BITE_ANIMATION_2=$BITE_ANIMATION_RIVER_POSITION1_2
            BITE_ANIMATION_3=$BITE_ANIMATION_RIVER_POSITION1_3
            echo "you chose position 1"
            sleep 0.5s
            break
            ;;
        "Place 2")
            FISH_WEIGHT_RANGE=10000

            WAITING_ANIMATION_1=$WAITING_ANIMATION_RIVER_POSITION2_1
            WAITING_ANIMATION_2=$WAITING_ANIMATION_RIVER_POSITION2_2
            WAITING_ANIMATION_3=$WAITING_ANIMATION_RIVER_POSITION2_3
            BITE_ANIMATION_1=$BITE_ANIMATION_RIVER_POSITION2_1
            BITE_ANIMATION_2=$BITE_ANIMATION_RIVER_POSITION2_2
            BITE_ANIMATION_3=$BITE_ANIMATION_RIVER_POSITION2_3
            
            echo "you chose position 2"
            sleep 0.5s
            break
            ;;
        "Place 3")
            FISH_WEIGHT_RANGE=12000

            WAITING_ANIMATION_1=$WAITING_ANIMATION_RIVER_POSITION3_1
            WAITING_ANIMATION_2=$WAITING_ANIMATION_RIVER_POSITION3_2
            WAITING_ANIMATION_3=$WAITING_ANIMATION_RIVER_POSITION3_3
            BITE_ANIMATION_1=$BITE_ANIMATION_RIVER_POSITION3_1
            BITE_ANIMATION_2=$BITE_ANIMATION_RIVER_POSITION3_2
            BITE_ANIMATION_3=$BITE_ANIMATION_RIVER_POSITION3_3

            echo "you chose position 3"
            sleep 0.5s
            break
            ;;
        *)  
            echo "invalid option $REPLY"
            ;;
    esac
done
}

ocean_positions(){
echo "Please enter position your bobber:"
positions=("Place 1" "Place 2" "Place 3" "Quit")
select opt in "${positions[@]}"
do
    case $opt in
        "Place 1")
            FISH_WEIGHT_RANGE=15000

            WAITING_ANIMATION_1=$WAITING_ANIMATION_OCEAN_POSITION1_1
            WAITING_ANIMATION_2=$WAITING_ANIMATION_OCEAN_POSITION1_2
            WAITING_ANIMATION_3=$WAITING_ANIMATION_OCEAN_POSITION1_3
            BITE_ANIMATION_1=$BITE_ANIMATION_OCEAN_POSITION1_1
            BITE_ANIMATION_2=$BITE_ANIMATION_OCEAN_POSITION1_2
            BITE_ANIMATION_3=$BITE_ANIMATION_OCEAN_POSITION1_3
            
            echo "you chose position 1"
            sleep 0.5s
            break
            ;;
        "Place 2")
            FISH_WEIGHT_RANGE=20000

            WAITING_ANIMATION_1=$WAITING_ANIMATION_OCEAN_POSITION2_1
            WAITING_ANIMATION_2=$WAITING_ANIMATION_OCEAN_POSITION2_2
            WAITING_ANIMATION_3=$WAITING_ANIMATION_OCEAN_POSITION2_3
            BITE_ANIMATION_1=$BITE_ANIMATION_OCEAN_POSITION2_1
            BITE_ANIMATION_2=$BITE_ANIMATION_OCEAN_POSITION2_2
            BITE_ANIMATION_3=$BITE_ANIMATION_OCEAN_POSITION2_3
            
            echo "you chose position 2"
            sleep 0.5s
            break
            ;;
        "Place 3")
            FISH_WEIGHT_RANGE=25000

            WAITING_ANIMATION_1=$WAITING_ANIMATION_OCEAN_POSITION3_1
            WAITING_ANIMATION_2=$WAITING_ANIMATION_OCEAN_POSITION3_2
            WAITING_ANIMATION_3=$WAITING_ANIMATION_OCEAN_POSITION3_3
            BITE_ANIMATION_1=$BITE_ANIMATION_OCEAN_POSITION3_1
            BITE_ANIMATION_2=$BITE_ANIMATION_OCEAN_POSITION3_2
            BITE_ANIMATION_3=$BITE_ANIMATION_OCEAN_POSITION3_3

            echo "you chose position 3"
            sleep 0.5s
            break
            ;;
        "Quit")
            exit 0
            ;;
        *)  
            echo "invalid option $REPLY"
            ;;
    esac
done
}

position_menu(){
clear
echo "Please enter position for fishing:"
positions=("Small lake" "River" "Ocean")
select opt in "${positions[@]}"
do
    case $opt in
        "Small lake")
            POSITION_INDICATOR='lake_positions'
            
            echo -e "you chose Lake \n"
            sleep 0.5s
            lake_positions
            break
            ;;
        "River")
            POSITION_INDICATOR='river_positions'
            
            echo -e "you chose river \n"
            sleep 0.5s
            river_positions
            break
            ;;
        "Ocean")
            POSITION_INDICATOR='ocean_positions'
            
            echo -e "you chose ocean \n"
            sleep 0.5s
            ocean_positions
            break
            ;;
        *)  
            echo "invalid option $REPLY"
            ;;
    esac
done
}

casting(){
    clear
    echo "There is a cast ~"
    sleep 0.5s
    clear
    echo "There is a cast ~~"
    sleep 0.5s
    clear
    echo "There is a cast ~~~"
    sleep 0.5s  
    clear
    echo "There is a cast ~~~~o"
    sleep 0.5s
    clear
    echo "There is a cast ~~~~(o)"
    sleep 0.5s  
}

gen_env(){
    ENV=0

    while [ "$ENV" -le $FLOOR ]
    do
        ENV=$RANDOM
        let "ENV %= $RANGE" 
    done
}

gen_catch(){
    CATCH=0

    while [ "$CATCH" -le $FLOOR ]
    do
        CATCH=$RANDOM
        let "CATCH %= $RANGE"  
    done
}

text_catcha(){
    echo -e ""
    echo -e "\e[31mCCCCAAAATTCCHAAAAA!!!!!!\e[0m"
    sleep 1s
}

waiting(){
gen_env
    while :
    do
        clear
        gen_catch
        if [ $CATCH == $ENV ]; then 
            text_catcha
            break;
        else
            debug_echo
            echo -e  $WAITING_ANIMATION_1
            sleep 0.75s
        fi

        clear
        gen_catch
        if [ $CATCH == $ENV ]; then 
            text_catcha
            break;
        else
            debug_echo
            echo -e $WAITING_ANIMATION_2
            sleep 0.75s
        fi

        clear
        gen_catch
        if [ $CATCH == $ENV ]; then 
            text_catcha
            break;
        else
            debug_echo
            echo -e $WAITING_ANIMATION_3
            sleep 0.75s
        fi

        clear
        gen_catch
        if [ $CATCH == $ENV ]; then 
            text_catcha
            break;
        else
            debug_echo
            echo -e $WAITING_ANIMATION_2
            sleep 0.75s
        fi

        if [ $DEMO_MODE == "TRUE" ];then
            break;
        fi
    done
}

bite_process(){    
bite_animation_time=5
while :
do
    stty -echo
    read -rs -N 1 -t 1 input
    stty erase "$key_1"
    ((bite_animation_time--))

    if [[ "$input" = "$key_1" || "$input" = "$key_2" ]]; then 
        break;
    fi

    clear
        echo -e $BITE_ANIMATION_1
        echo -e "\e[31mTo catch fish hold down the ${keyboard_key} .\e[0m"   
    sleep 0.5s
    clear
        echo -e $BITE_ANIMATION_2
        echo -e "\rTo catch fish hold down the ${keyboard_key} .."
    sleep 0.5s
    clear
        echo -e $BITE_ANIMATION_3
        echo -e "\e[31mTo catch fish hold down the ${keyboard_key} ...\e[0m"  
    sleep 0.5s
    clear   
        echo -e $BITE_ANIMATION_2
        echo -e "\rTo catch fish hold down the ${keyboard_key} ...."
    sleep 0.5s

    if [ $bite_animation_time == 0 ]; then
        echo -e "Time is over :?"
        sleep 3s
        skip_bite
    fi
done
}

skip_bite(){
    echo -e "\e[31mYou are skiped bite (X_X)\e[0m" 
    sleep 5s
    quit_menu
}

got_off(){ 
    clear
    echo "Got off fish :("
    echo "Let's try again!"
    echo "Good Luck in next time!"
    sleep 5s
    quit_menu
}

fish_rod_broken(){
    stty -echo
    echo -e "\e[31mYour fish-rod is broken (T_T)\e[0m" 
    sleep 5s
    fish_rod_menu
}

gen_fish_weight(){
    FISH_WEIGHT=$RANDOM
    let "FISH_WEIGHT %= $FISH_WEIGHT_RANGE"
}

caught(){
gen_fish_weight
    if [ "$FISH_WEIGHT" -ge "$FISH_ROD_MAX_WEIGHT" ];then
        echo -e "Sooooo haaarrrddd........"
        sleep 3s
        fish_rod_broken
    else    
        fish_info
        sleep 5s
    fi
}

lake_fish_selector(){
    if [ "$FISH_WEIGHT" -le "1000" ];then
        lake_fish=$(echo -e "\e[33mRoach\e[0m")
        fish_value=0.05

        elif [ "$FISH_WEIGHT" -le "2000" ];then
            lake_fish=$(echo -e "\e[32mRuff\e[0m")
            fish_value=0.06

        elif [ "$FISH_WEIGHT" -lt "3500" ];then
            lake_fish=$(echo -e "\e[35mBream\e[0m")
            fish_value=0.08

        elif [ "$FISH_WEIGHT" -ge "3500" ];then
            if (( RANDOM % 2 )); 
            then 
                lake_fish=$(echo -e "\e[31mCarpe\e[0m");
                fish_value=0.09
            else 
                lake_fish=$(echo -e "\e[34mPike\e[0m");
                fish_value=0.1
            fi
    fi
}

ocean_fish_selector(){
    if [ "$FISH_WEIGHT" -le "2500" ];then
        ocean_fish=$(echo -e "\e[31mMackerel\e[0m")
        fish_value=0.08

        elif [ "$FISH_WEIGHT" -le "7500" ];then
            ocean_fish=$(echo -e "\e[32mTuna\e[0m")
            fish_value=0.09

        elif [ "$FISH_WEIGHT" -lt "12500" ];then
            ocean_fish=$(echo -e "\e[33mFlounder\e[0m")
            fish_value=0.1

        elif [ "$FISH_WEIGHT" -ge "12500" ];then
            if (( RANDOM % 2 )); 
            then 
                ocean_fish=$(echo -e "\e[34mHalibut\e[0m");
                fish_value=0.15
            else 
                ocean_fish=$(echo -e "\e[34mShark\e[0m");
                fish_value=0.2
            fi
    fi
}

fish_info(){
clear
    echo "We are caught! :)"
        if [ $POSITION_INDICATOR == "ocean_positions" ]; then
            ocean_fish_selector
            echo -e $ocean_fish
        else
            lake_fish_selector
            echo -e $lake_fish
        fi
    echo "WEIGHT: $FISH_WEIGHT g."
}

fish_sale(){
stty echo
    echo 'Sale fish or release fish"'
    select opt in Sale Release ; 
    do
        case $opt in
        "Sale")
            sleep 5s
            coin=$(($FISH_WEIGHT*$fish_value))
            sleep 5s
            ((money+=${coin}))
            sleep 5s
            echo "Fish saled! You a get ${coin}$"
            sleep 1s
            quit_menu
            ;;
        "Release")
            echo "Let to water..."
            sleep 3s
            quit_menu
            ;;
        *) 
            echo "invalid option $REPLY"
            ;;
        esac
    done
}

result(){
    if (( RANDOM % 2 )); 
        then 
            caught
            fish_sale; 
        else 
            got_off;
    fi
}

playing_fish(){
stty -echo
PROGRESS=0
bar=''

while true;
do
read -rs -N 1 -t 1 input
    if [[ "$input" = "$key_1" || "$input" = "$key_2" ]]; then
        stty erase "$key_1" 2> /dev/null
        ((PROGRESS+=1))
        sleep 0.05
        bar="${bar} "
        echo -ne "\r"
        echo -ne "\e[46m$bar\e[0m"
        echo -n "${PROGRESS}%"
    else
        ((PROGRESS-=1))
        stty erase "$key_1"
        sleep 0.05
        bar="${bar}"
        echo -ne "\r"
        echo -ne "\e[41m${bar}\e[0m"
        echo -n "${PROGRESS}%"
    fi

    if [ $PROGRESS = 100 ];then
        echo ""
        echo "What i'd catch ???"
        sleep 3s
        result
    fi
    
    if [ $PROGRESS = -10 ];then
        echo ""
        skip_bite
    fi
done
}

quit_menu(){
stty echo

clear
echo "You have a ${money}$
"
echo -e 'Please select \e[44m"Restart"\e[0m or \e[45m"Switch Fish-rod"\e[0m or \e[46m"Quit of game\e[0m"'
select opt in 'Restart' 'Switch' 'Quit'; 
do
     case $opt in
       "Restart")
            echo "you chose restart" 
            sleep 1s
            game
            ;;
        "Switch")
            echo "you chose switch fish-rod"
            sleep 1s 
            fish_rod_menu
            ;;
        "Quit")
            clear
            echo "Exit..."
            exit 0 
            ;;
        *)
            echo "invalid option $REPLY"
            ;;
    esac
done
}

#Default settings to console when Emergency 
status=$?
if [ $status -ne 0 || $status -ne 1 ]; then
    stty echo
    stty erase ^?
fi

game(){
    position_menu
    casting
    waiting
    bite_process
    playing_fish
}

settings_menu(){
    clear    
    echo -e "\e[33mSettings :\e[0m"
    echo -e ""
    key_map_menu
    difficulty_level_menu
}

check_console_size
settings_menu
fish_rod_menu

game 