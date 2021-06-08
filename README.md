# console-fishing

## Bash script to play fishing on Terminal

To start input:
```
./fish.sh
```
or 
```
bash fish.sh 
```
## Bug Report

1. After progress bar, when select "restart" or "quit" output "Incorrect input".
Technically this is not bug; When your press "F" in console input many characters "f" (invisible). When you are input "1" in Select menu, console have input "*ffffffffffffff*1" and output "Incorrect input" 
2. If many times press "any key" + "f" line print cascade progress bar;
This is not bug too; Progress bar is output "box" character and new press write on console new character. When line more than console border, console write line like cascade.   