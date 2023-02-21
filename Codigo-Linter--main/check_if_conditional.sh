#!/usr/bin/env bash

StringFor=$( echo $FILE | grep -Poz "\bif\b(\s*|.+){1,}\bfi\b" | tr -d '\0' > out.txt)

if [ -n "$StringFor" ]; then
    StringForChecked=$( echo $StringFor | grep -Poz "\bif\s+(\[\s+).+(\s+\])(\s+|;)\s?\bthen(?!(?=\s+\bfi))\s+(?(?=\n)\s+|.+){1,}?\bfi\b"| tr -d '\0' > out.txt)

   
    if [ -z "$StringForChecked" ]; then
        #  echo""
        echo "There is error in IF: "
        echo  "$StringFor"
        # echo ""
   
    else
        #  echo ""
         printf "there is no error in IF conditional: "
        #  echo ""
    fi
    
fi

# for\s*(\(\()+.+(\)\));\s*\bdo\b\s+(.|\s)+\b(done)\b