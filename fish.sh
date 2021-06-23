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
echo -e "\e[31mVersion 0.6.1 RC1\e[0m"
echo -e ""
echo -e "Advices:"
echo -e "\e[32mFor comfort play, please, open terminal on FullScreen\e[0m"
echo -e "\e[35mPlease, use Eng Keyboard Layout\e[0m"
sleep 10s

#------------------------------------------------------------/

#VALUES
#initialize randome borders
FLOOR=10
RANGE=100

#initialize envirement values
money=350
position_index=''
FISH_ROD_MAX_WEIGHT=0
FISH_WEIGHT=0
CATCH=0
ENV=0

#Button on board
key_1=''
key_2=''
keyboard_key=''

#------------------------------------------------------------/

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

demo_mode_menu(){
stty echo
clear
echo -e "\e[33mSettings :\e[0m
"
echo -e "Select Game Mode:"
    select opt in "Demo" "Full Game"; 
    do
        case $opt in
        "Demo")
            DEMO_MODE=TRUE
            echo -e "Demo mode ON"
            sleep 2s
            break
            ;;
        "Full Game")
            DEMO_MODE=FASLE
            echo -e "Full game mode ON"
            sleep 2s
            break
            ;;
        *) 
            echo "invalid option $REPLY"
            ;;
        esac
    done
}

key_map_menu(){
stty echo

echo -e ""
echo -e "Select key mapping:"
    select opt in "Key 'F'" "Key 'Space'"; 
    do
        case $opt in
        "Key 'F'")
            keyboard_key='F'
            key_1="f"   #Eng
            key_2=$'\320\260'
            #key_2="а"   #Rus
            echo -e "You are select key F"
            sleep 3s
            break
            ;;
        "Key 'Space'")
            keyboard_key='Space'
            key_1=$'\x20'   #Space
            key_2=$'\x0a'   #Enter
            echo "You are select key Space"
            sleep 3s
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
1. Fish Liter N5;               100$;   5kg; 
2. Fish Hunter Pro M10RT;       250$;   10kg; 
3. Fish Kung Fu Master R20V;    450$;   20kg; 

Selecte Fish-rod:"

fish_rods_list=("Fish Liter N5" "Fish Hunter Pro M10RT" "Fish Kung Fu Master R20V")
select opt in "${fish_rods_list[@]}"
do
    case $opt in
        "Fish Liter N5")
            if [ "$money" -lt "100" ];then
                echo "You don't have a money. Sorry :("
                sleep 3s
                exit 0
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

#START GAME 

# Select one of many position of bobber

lake_positions(){
echo "Please enter position your bobber:"
positions=("Place 1" "Place 2" "Place 3")
select opt in "${positions[@]}"
do
    case $opt in
        "Place 1")
            RANGE=6500

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
            RANGE=7500

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
            RANGE=8500

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
            RANGE=7500

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
            RANGE=9000

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
            RANGE=11000

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
            RANGE=15000

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
            RANGE=20000

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
            RANGE=25000

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
            position_index='lake_positions'
            
            echo -e "you chose Lake \n"
            sleep 0.5s
            lake_positions
            break
            ;;
        "River")
            position_index='river_positions'
            
            echo -e "you chose river \n"
            sleep 0.5s
            river_positions
            break
            ;;
        "Ocean")
            position_index='ocean_positions'
            
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

# START Animation 

gen_env(){
    ENV=$RANDOM
    let "ENV %= $RANGE" 
}

gen_catch(){
    CATCH=$RANDOM
    let "CATCH %= $RANGE"  
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
            #echo $CATCH!=$ENV #DEBUG TAKT INFO
            echo -e  $WAITING_ANIMATION_1
            sleep 0.75s
        fi

        clear
        gen_catch
        if [ $CATCH == $ENV ]; then 
            text_catcha
            break;
        else
            #echo $CATCH!=$ENV #DEBUG TAKT INFO
            echo -e $WAITING_ANIMATION_2
            sleep 0.75s
        fi

        clear
        gen_catch
        if [ $CATCH == $ENV ]; then 
            text_catcha
            break;
        else
            #echo $CATCH!=$ENV #DEBUG TAKT INFO
            echo -e $WAITING_ANIMATION_3
            sleep 0.75s
        fi

        clear
        gen_catch
        if [ $CATCH == $ENV ]; then 
            text_catcha
            break;
        else
            #echo $CATCH!=$ENV #DEBUG TAKT INFO
            echo -e $WAITING_ANIMATION_2
            sleep 0.75s
        fi
     done
}

# Animation PocKlewKI BLEAT

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
    let "FISH_WEIGHT %= $RANGE"
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

        elif [ "$FISH_WEIGHT" -le "2000" ];then
            lake_fish=$(echo -e "\e[32mRuff\e[0m")

        elif [ "$FISH_WEIGHT" -le "3500" ];then
            lake_fish=$(echo -e "\e[35mBream\e[0m")

        elif [ "$FISH_WEIGHT" -ge "3500" ];then
            if (( RANDOM % 2 )); 
            then 
                lake_fish=$(echo -e "\e[31mCarpe\e[0m");
            else 
                lake_fish=$(echo -e "\e[34mPike\e[0m");
            fi
    fi
}

ocean_fish_selector(){
    if [ "$FISH_WEIGHT" -le "2500" ];then
        ocean_fish=$(echo -e "\e[31mMackerel\e[0m")
        
        elif [ "$FISH_WEIGHT" -le "7500" ];then
            ocean_fish=$(echo -e "\e[32mTuna\e[0m")
        
        elif [ "$FISH_WEIGHT" -le "12500" ];then
            ocean_fish=$(echo -e "\e[33mFlounder\e[0m")
        
        elif [ "$FISH_WEIGHT" -ge "12500" ];then
            if (( RANDOM % 2 )); 
            then 
                ocean_fish=$(echo -e "\e[34mShark\e[0m");
            else 
                ocean_fish=$(echo -e "\e[34mHalibut\e[0m");
            fi
    fi
}

fish_info(){
#lake_fish_list=$(shuf -n1 -e "\e[31mCarpe\e[0m" "\e[32mRuff\e[0m" "\e[33mRoach\e[0m" "\e[34mPike\e[0m")
#ocean_fish_list=$(shuf -n1 -e "\e[31mMackerel\e[0m" "\e[32mTuna\e[0m" "\e[33mFlounder\e[0m" "\e[34mHalibut\e[0m" "\e[34mShark\e[0m")
    
clear
    echo "We are caught! :)"
        if [ $position_index == "ocean_positions" ]; then
            ocean_fish_selector
            echo -e $ocean_fish
        else
            lake_fish_selector
            echo -e $lake_fish
        fi
    echo "WEIGHT: $FISH_WEIGHT g."
}

get_coin(){
    coin=$(($FISH_WEIGHT/100))
    ((money+=$coin))
    echo "Fish saled! You a get ${coin}$"
    sleep 1s 
}

fish_sale(){
stty echo
    echo 'Sale fish or release fish"'
    select opt in sale release ; 
    do
        case $opt in
        "sale")
            get_coin
            break
            ;;
        "release")
            echo "Let to water..."
            sleep 3s
            break
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
        stty erase "$key_1"
        ((PROGRESS+=1))
        sleep 0.05
        bar="${bar} "
        echo -ne "\r"
        echo -ne "\e[46m$bar\e[0m"
        echo -n "${PROGRESS}%"
    else
        ((PROGRESS-=1))
        sleep 0.05
        bar="${bar} "
        echo -ne "\r"
        echo -ne "\e[41m$bar\e[0m"
        echo -n "${PROGRESS}%"
    fi

    if [ $PROGRESS = 100 ];then
        echo ""
        echo "What i'd catch ???"
        sleep 3s
        result
    fi
    
    if [ $PROGRESS = -10 ];then
        skip_bite
    fi
done
}

#Notification Restart or Exit 
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
sleep 5s
}

#REWRITE
game(){
    if [ $DEMO_MODE == 'TRUE' ];then 
        position_menu
        casting
        #waiting
        bite_process
        playing_fish
    else
        position_menu
        casting
        waiting
        bite_process
        playing_fish
    fi
}

settings_menu(){
    demo_mode_menu
    key_map_menu
}

check_console_size
settings_menu
fish_rod_menu

game 
