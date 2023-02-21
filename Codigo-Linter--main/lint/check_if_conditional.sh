#!/usr/bin/env bash

StringFor=$(cat $FILE | grep -Poz "\bif\b(\s*|.+){1,}\bfi\b")

if [ -n "$StringFor" ]; then
    echo ""
    # echo "$StringFor"
    echo "hi"
    StringForChecked=$(echo $StringFor | grep -Poz "\bif\s+(\[\s+).+(\s+\])(\s+|;)\s?\bthen(?!(?=\s+\bfi))\s+(?(?=\n)\s+|.+){1,}?\bfi\b")

    echo ""
    if [ -z "$StringForChecked" ]; then
         
        echo "There is error in : "
        echo  "$StringFor"
        echo ""
   
    else
         printf "there is no error in IF conditional "
    fi
    
fi

# for\s*(\(\()+.+(\)\));\s*\bdo\b\s+(.|\s)+\b(done)\b