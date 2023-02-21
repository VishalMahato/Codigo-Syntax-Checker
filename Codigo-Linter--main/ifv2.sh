#!/usr/bin/env bash
FIL=$FILE
FIL=$( echo "$FIL" | tr -d '\0')
StringFor=$( echo "$FIL" | grep -Poz "\bif\b(\s*|.+){1,}\bfi\b\n" ) 
StringFor=$(cat "out.txt")
if [ -n "$StringFor" ]; then

    StringForChecked=$( echo "$StringFor" | grep -Poz "\bif\s+(\[\s+).+(\s+\])(\s+|;)\s?\bthen(?!(?=\s+\bfi))\s+(?(?=\n)\s+|.+){1,}?\bfi\b\n" | tr -d '\0' >out1.txt)

    StringForChecked=$(cat "out1.txt")

   
    if [ -n "$StringForChecked" ]; then
        echo ""
        echo "There is error in : "
        echo  "$StringFor"
        echo ""
   
    else
         echo ""
         printf "there is no error in IF conditional "
         echo ""
    fi
    
fi

