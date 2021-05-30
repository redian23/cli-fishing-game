#!/bin/bash

ANIMAT1="\n
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
ANIMAT2="\n
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

ANIMAT3="\n
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

ANIMAT10="\n
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


ANIMAT11="\n
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

ANIMAT12="\n
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
echo "Version 0.0.7 pre-alpha" 
sleep 5s

# Select one of many position poplowka

# START Animation 

start(){
CATCH=$RANDOM
#while :
#do
clear
echo $CATCH!=$RANDOM
echo -e  $ANIMAT1
sleep 0.5s

clear
echo $CATCH!=$RANDOM
echo -e  $ANIMAT2
sleep 0.5s

clear
echo $CATCH!=$RANDOM
echo -e  $ANIMAT3
sleep 0.5s

clear
echo $CATCH!=$RANDOM
echo -e  $ANIMAT2
sleep 0.5s

if [ $CATCH -eq $RANDOM ]; then
break 
clear
echo "EEEEHHHHHHHHHHHHYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYY"
sleep 10s
fi
  
#done

# Animation PocKlewKI BLEAT
# Logic 
FISH=FALSE
while [ $FISH == "FALSE" ]
do
    clear
echo "To catch fish press 'Space'"
    echo -e  $ANIMAT10
echo $FISH    
sleep 2s
    clear
echo "To catch fish press 'Space'"
    echo -e  $ANIMAT11
echo $FISH    
sleep 2s
    clear
echo "To catch fish press 'Space'"
    echo -e  $ANIMAT12
echo $FISH    
sleep 2s
    clear
echo "To catch fish press 'Space'"
    echo -e  $ANIMAT11
    sleep 2s
if [[ "$SELECT" != $'\x20' ]]; then 
  read -s -N 1 SELECT
  [[ "$SELECT" == $'\x20' ]] && FISH=TRUE
    break
fi
done


#Print fishs & witgh

clear
echo -e " alpha-Fish-001 {250}gr "
sleep 5s
}

start 
#Notification Restart or Exit 

clear 
echo -e "Restart or Exit "
sleep 3s
# if [select 1]; then
# goto start()
# fi

# if [secelct 2]; then 
clear
echo "Exit..."
exit 0
# fi

