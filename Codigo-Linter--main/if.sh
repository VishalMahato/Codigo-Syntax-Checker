#!/usr/bin/env bash
FIL=$FILE
FIL=$( echo "$FIL" | tr -d '\0')
StringFor=$( echo "$FIL" | grep -Poz "\bif\b(\s*|.+){1,}\bfi\b" | tr -d '\0' > out.txt) 
StringFor=$(cat "out.txt")

if [ -n "$StringFor" ]; then
   
    StringForChecked=$( echo "$StringFor" | grep -Poz "\bif\s+(\[\[?\s+).+(\s+\](\])?)(\s*;)\s?\bthen(?!(?=\s+\bfi))\s+(?(?=\n)\s+|.+){1,}?\bfi\b"| tr -d '\0' > out.txt)
    StringForChecked=$(cat "out.txt")
    # echo "unfil - 
    # $StringFor"
    # echo "fil - 
    # $StringForChecked"
   
    if [ -z "$StringForChecked" ]; then
        { 
        echo "" 
        echo "--> There is error in IF conditional : " >> result.txt
        echo  "$StringFor"
        echo "" 
        }>> result.txt
   
    else
         {
         echo "--> There is no error in IF conditional " 
         echo ""
         } >> result.txt

    fi
    
fi
