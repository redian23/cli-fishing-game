#!/bin/bash
read -s -p 'Type something I promise to keep it a secret: ' > 1.txt
echo "";
echo "Your secret is safe with me" ; #unset REPLY ;
echo "${REPLY}"