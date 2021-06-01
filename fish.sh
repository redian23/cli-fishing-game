#!/bin/bash

#TODO
# больше вариантов расположения попловка
# 
# картинки рыб
# рандомные виды рыб
# (когда нибудь) выбор через стрелочки расположение попловка /
# /да тупо по секторна сдеать 9 вариантов и все и выбрать от одного до девяти
# переработать систему рандома когда ожидается попадение рыбы // сделать меньше диапозон или выставыить рандом диапозон от 1 до 600 и преровнять их к секундам т.е сдетаать ловлю черех такты  
# мол рандом == 10 -> 10s длится цикл анимации, потом он передает брейк и начинатеся агнимация клевания  
#

FISH1="\n
><)))*)>
"


WAITING_ANIMATION_1="\n
_________________________\n
|\t\t\t			        |\n 
|\t\t\t			        |\n
|\t\t  \  \t		    |\n
|\t\t  o  \t 		    |\n
|\t\t\t			        |\n
|\t\t\t			        |\n
|\t\t\t			        |\n
|\t\t\t			        |\n
|\t\t\t			        |\n
|\t\t\t			        |\n
|_______________________|\n 
"
WAITING_ANIMATION_2="\n
_________________________\n
|\t\t\t                 |\n
|\t\t\t                 |\n
|\t\t  |  \t            |\n
|\t\t  o  \t            |\n
|\t\t\t                 |\n
|\t\t\t                 |\n
|\t\t\t                 |\n
|\t\t\t                 |\n
|\t\t\t                 |\n
|\t\t\t                 |\n
|_______________________|\n
"

WAITING_ANIMATION_3="\n
_________________________\n
|\t\t\t                 |\n
|\t\t\t                 |\n
|\t\t  /  \t            |\n
|\t\t  o  \t            |\n
|\t\t\t                 |\n
|\t\t\t                 |\n
|\t\t\t                 |\n
|\t\t\t                 |\n
|\t\t\t                 |\n
|\t\t\t                 |\n
|_______________________|\n
"

BITE_ANIMATION_1="\n
_________________________\n
|\t\t\t                 |\n
|\t\t\t                 |\n
|\t\t\t                 |\n
|\t\t  (o)  \t          |\n
|\t\t\t                 |\n
|\t\t\t                 |\n
|\t\t\t                 |\n
|\t\t\t                 |\n
|\t\t\t                 |\n
|\t\t\t                 |\n
|_______________________|\n
"


BITE_ANIMATION_2="\n
_________________________\n
|\t\t\t                 |\n
|\t\t\t                 |\n
|\t\t\t                 |\n
|\t\t( o ) \t           |\n
|\t\t\t                 |\n
|\t\t\t                 |\n
|\t\t\t                 |\n
|\t\t\t                 |\n
|\t\t\t                 |\n
|\t\t\t                 |\n
|_______________________|\n
"

BITE_ANIMATION_3="\n
_________________________\n
|\t\t\t                 |\n
|\t\t\t                 |\n
|\t\t\t                 |\n
|\t\t (   o   )\t       |\n
|\t\t\t                 |\n
|\t\t\t                 |\n
|\t\t\t                 |\n
|\t\t\t                 |\n
|\t\t\t                 |\n
|\t\t\t                 |\n
|_______________________|\n
"

#Start Script

clear
echo "Welcome!" 
echo "You are start to play in Console Fishing"
echo "This is simlpe bash script, but to have so mach fun."
echo "Create by Redian23"
echo "Version 0.1.5 alpha"

echo -e $FISH1
sleep 5s

#START GAME 

select_position(){
# Select one of many position of bobber
clear
echo "Please enter position your bobber:"
positions=("Positions 1" "Positions 2" "Positions 3" "Quit")
select opt in "${positions[@]}"
do
    case $opt in
        "Positions 1")
            echo "you chose position 1"
            sleep 0.5s
            break
            ;;
        "Positions 2")
            echo "you chose position 2"
            sleep 0.5s
            break
            ;;
        "Positions 3")
            echo "you chose position 3"
            sleep 0.5s
            break
            ;;
        "Quit")
            exit 0
            ;;
        *) echo "invalid option $REPLY"
            exit 0
            ;;
    esac
done

clear
echo "There is a cast."
sleep 0.5s
clear
echo "There is a cast.."
sleep 0.5s
clear
echo "There is a cast..."
sleep 0.5s

}

# START Animation 
waiting(){
    
    #CATCH=$RANDOM
    CATCH=15747

    #while :
    #do
    clear
    echo $CATCH!=$RANDOM
    echo -e  $WAITING_ANIMATION_1
    sleep 0.5s

    clear
    echo $CATCH!=$RANDOM
    echo -e  $WAITING_ANIMATION_2
    sleep 0.5s

    clear
    echo $CATCH!=$RANDOM
    echo -e  $WAITING_ANIMATION_3
    sleep 0.5s

    clear
    echo $CATCH!=$RANDOM
    echo -e  $WAITING_ANIMATION_2
    sleep 0.5s

    if [ $CATCH -eq $RANDOM ]; then 
    break 
    clear
    echo "EEEEHHHHHHHHHHHHYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYY"
    sleep 10s
    fi
    #done
}


# Animation PocKlewKI BLEAT
# Logic
bite(){ 
FLOOR=0
RANGE=5
number=0   #initialize
while [ "$number" -le $FLOOR ]
do
  number=$RANDOM
  let "number %= $RANGE"  # Ограничение "сверху" числом $RANGE.
done

for (( i=1; i <= number; i++ ))
do    
    clear
        echo "To catch fish press 'Space.'"
        echo -e  $BITE_ANIMATION_1   
    sleep 2s
    clear
        echo "To catch fish press 'Space..'"
        echo -e  $BITE_ANIMATION_2  
    sleep 2s
    clear
        echo "To catch fish press 'Space...'more times"
        echo -e  $BITE_ANIMATION_3  
    sleep 2s
    clear   
        echo "To catch fish press 'Space....'more times"
        echo -e  $BITE_ANIMATION_2
    sleep 2s

    read -s -N 1 SELECT
    if [[ "$SELECT" == $'\x20' ]]; then
        result
        break;
    else 
        skip_bite
        break;
    fi
done    
}
skip_bite(){
    clear
    echo "You are skiped bite"
    sleep 5s
}

got_off(){ 
    clear
    echo "Got off fish :("
    fish="Karasb"
    echo -e " $fish ~$RANDOM gramm "
    sleep 5s
}

caught(){
    clear
    echo "We are caught! :)"
    fish="Karasb"
    echo -e " $fish $RANDOM gramm "
    sleep 5s
}
result(){
    if (( RANDOM % 2 )); 
        then got_off;
        else caught; 
    fi
}

#Notification Restart or Exit 
quit(){
clear 
echo "Restart or Exit "
echo 'Please enter your choice'
select opt in restart quit ; do
     case $opt in
       "restart")
            echo "you chose restart" 
            game
            ;;
        "quit")
            clear
            echo "Exit..."
            exit 0 
            break ;;
        *) echo invalid option ;;
    esac
done
sleep 5s
}

#Inter on the game (like psvm in java)
game(){
    select_position
    waiting
    bite
    quit
}

game #up method game



