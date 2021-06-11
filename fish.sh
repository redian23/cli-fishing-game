#!/bin/bash
source pics.sh
stty -echo

#Welcome
clear
echo -e $WELCOME
echo -e "\e[32mWelcome!\e[0m" 
echo -e "You are start to play in Console Fishing"
echo -e "This is simlpe bash script, but to have so mach fun."
echo -e "\e[33mCreate by Redian23\e[0m"
echo -e "\e[31mVersion 0.4.1 beta\e[0m"
echo -e ""
echo -e "\e[32mFor comfort play, please, open terminal on FullScreen\e[0m"
sleep 10s

# Global initialize borders
FLOOR=10
RANGE=100

#initialize variebles
CATCH=0
ENV=0
FISH_WEIGHT=0
position=''

#Select fish-rog
FISH_FOG_MAX_WEIGHT=0
#money=300
money=500

#Button on board
key_1=''
key_2=''

select_key_mapping(){
stty echo
echo -e "Select key mapping:"
    select opt in "Key 'F'" "Key 'Space'"; 
    do
        case $opt in
        "Key 'F'")
            key_1="f"
            key_2="а"
            echo -e "You are select key F"
            sleep 3s
            break
            ;;
        "Key 'Enter'")
            key_1=$'\x20'
            key_2=$'\x0a'
            echo "You are select key Space"
            sleep 3s
            break
            ;;
        *) 
            echo invalid option 
            ;;
        esac
    done
}

select_fish_rog(){
stty echo

clear
echo -e "\e[33mYou are have a $money$\e[0m"
echo "
List fish-ros:
*  Name:                        Price:  Max Weith:
1. Fish Liter N5;               100$;   5kg; 
2. Fish Hunter Pro M10RT;       250$;   10kg; 
3. Fish Kung Fu Master R20V;    450$;   20kg; 

Selecte Fish-rog:"

fishrogs=("Fish Liter N5" "Fish Hunter Pro M10RT" "Fish Kung Fu Master R20V" "Quit")
select opt in "${fishrogs[@]}"
do
    case $opt in
        "Fish Liter N5")
            if [ "$money" -lt "100" ];then
                echo "You don't have a money. Sorry :("
                sleep 5s
                exit 0
            fi
            ((money-=100))       
            FISH_FOG_MAX_WEIGHT=5000
            echo "You are select Fish Liter N5; -100$"
            sleep 1s
            break
            ;;
        "Fish Hunter Pro M10RT")
            if [ "$money" -lt "250" ];then
                echo "You don't have a money. Sorry :("
                sleep 5s
                exit 0
            fi
            ((money-=250)) 
            FISH_FOG_MAX_WEIGHT=10000
            echo "You are select Fish Hunter Pro M10RT; -250$"
            sleep 1s
            break
            ;;
        "Fish Kung Fu Master R20V")
            if [ "$money" -lt "450" ];then
                echo "You don't have a money. Sorry :("
                sleep 5s
                exit 0
            fi
            ((money-=450)) 
            FISH_FOG_MAX_WEIGHT=20000
            echo "You are select Fish Kung Fu Master R20V; -450$"
            sleep 1s
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
game
}

#START GAME 

# Select one of many position of bobber

lake_positions(){
echo "Please enter position your bobber:"
positions=("Place 1" "Place 2" "Place 3" "Quit")
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
            
            echo "you chose position 1"
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
            
            echo "you chose position 2"
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

river_positions(){
echo "Please enter position your bobber:"
positions=("Place 1" "Place 2" "Place 3" "Quit")
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
        "Quit")
            exit 0
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

select_position(){
clear
echo "Please enter position for fishing:"
positions=("Small lake" "River" "Ocean" "Quit")
select opt in "${positions[@]}"
do
    case $opt in
        "Small lake")
            position='lake_positions'
            
            echo -e "you chose Lake \n"
            sleep 0.5s
            lake_positions
            break
            ;;
        "River")
            position='river_positions'
            
            echo -e "you chose river \n"
            sleep 0.5s
            river_positions
            break
            ;;
        "Ocean")
            position='ocean_positions'
            
            echo -e "you chose ocean \n"
            sleep 0.5s
            ocean_positions
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
    clear
    echo "CCCCAAAATTCCHAAAAA!!!!!!"
    sleep 1s
}

waiting(){
gen_env
#     while :
#     do
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
#     done
}

# Animation PocKlewKI BLEAT

BITE_ANIMATION(){
    clear
        echo -e $BITE_ANIMATION_1   
    sleep 1s
    clear
        echo -e $BITE_ANIMATION_2  
    sleep 1s
    clear
        echo -e $BITE_ANIMATION_3  
    sleep 1s
    clear   
        echo -e $BITE_ANIMATION_2
    sleep 1s
}

press_F(){
    echo -ne "\rTo catch fish press 'F' ."
    sleep 0.2s
    echo -ne "\rTo catch fish press 'F' .."
    sleep 0.2s
    echo -ne "\rTo catch fish press 'F' ..."
    sleep 0.2s
    echo -ne "\rTo catch fish press 'F' ...."
    echo ""
    sleep 0.2s
}

skip_bite(){
    clear
    echo "You are skiped bite (X_X)"
    sleep 5s
}

fish-rog_broken(){
    stty -echo
    echo ""
    echo "Your fish-rod is broken (T_T)"
    sleep 5s

    select_fish_rog
    sleep 3s
}

got_off(){ 
    clear
    echo "Got off fish :("
    echo "Let's try again!"
    echo "Good Luck in next time!"
    sleep 5s
}

fish_info(){
lake_fishs=$(shuf -n1 -e "\e[31mCarpe\e[0m" "\e[32mRuff\e[0m" "\e[33mRoach\e[0m" "\e[34mPike\e[0m")
ocean_fishs=$(shuf -n1 -e "\e[31mMackerel\e[0m" "\e[32mTuna\e[0m" "\e[33mFlounder\e[0m" "\e[34mHalibut\e[0m" "\e[34mShark\e[0m")

clear
echo "We are caught! :)"
    if [ $position == "ocean_positions" ]; then
        echo -e $ocean_fishs
    else
        echo -e $lake_fishs
    fi
echo "WEIGHT: $FISH_WEIGHT g."
}

caught(){

FISH_WEIGHT=$RANDOM
let "FISH_WEIGHT %= $RANGE"

    if [ "$FISH_WEIGHT" -ge "$FISH_FOG_MAX_WEIGHT" ];then
        
        sleep 3s
        fish-rog_broken
        sleep 5s
    else    
        fish_info
        sleep 5s
    fi
}

get_coin(){
    coin=$(($FISH_WEIGHT/100))
    ((money+=$coin))
    echo "Fish saled! You a get $coin$"
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
            echo invalid option 
            ;;
        esac
    done
}

result(){
    if (( RANDOM % 2 )); 
        then 
            got_off;
        else 
            caught
            fish_sale; 
    fi
}

bite(){
stty -echo
PROGRESS=0
bar=''
               
BITE_ANIMATION 
press_F

while true;
do
stty -echo
read -rs -N 1 -t 1 input
    
    if [ "$input" = "$key_1" ] || [ "$input" = "$key_2" ]; then     # Russian "a" on key button F 
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
        break;
    fi
    
    if [ $PROGRESS = -10 ];then
        
        skip_bite
        break;
    fi
done
}

#Notification Restart or Exit 
quit(){
stty echo

clear
echo "You have a $money$
"
echo 'Please select "Restart" or "Switch Fish-rog" or "Exit"'
select opt in restart switch quit ; 
do
     case $opt in
       "restart")
            echo "you chose restart" 
            sleep 1s
            game
            ;;
        "switch")
            echo "you chose switch fish-rog"
            sleep 1s 
            select_fish_rog
            ;;
        "quit")
            clear
            echo "Exit..."
            exit 0 
            ;;
        *) echo invalid option 
            ;;
    esac
done
sleep 5s
}

game(){
    select_position
   # casting
   # waiting
    bite
    quit
}

select_key_mapping
select_fish_rog

game 
