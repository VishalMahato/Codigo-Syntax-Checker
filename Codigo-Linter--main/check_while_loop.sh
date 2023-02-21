#!/usr/bin/env bash

StringFor=$( echo $FILE | grep -Poz "\bwhile\b(?:\s*|.+){1,}?\bdone\b" | tr -d '\0' > out.txt)

if [ -n "$StringFor" ]; then
    echo ""
   
 
    StringForChecked=$( echo $StringFor | grep -Poz "\bwhile\b\s+\[\s[^\n]*\s\]\s*(?:\s*|;)\s*\bdo\b(?!\s+done).*(?:\s+|.){1,}?\bdone\b"| tr -d '\0' >out.txt)
   
   
    StringFor=$( cat out.txt)

    echo ""
    if [ -z "$StringForChecked" ]; then
         
        echo "There is error in While Loop : "
        echo "$StringFor"
        echo ""
   
    else
         printf "there is no error in While conditional "
    fi
fi
