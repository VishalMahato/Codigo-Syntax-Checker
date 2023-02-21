#!/usr/bin/env bash
FIL=$FILE
FIL=$( echo "$FIL" | tr -d '\0')
StringFor=$( echo "$FILE" | grep -Poz "(\bwhile\b)(\s*|.+){1,}(\bdone\b)" | tr -d '\0' > out.txt) 
StringFor=$(cat "out.txt" )
#  echo "$StringFor"

if [ -n "$StringFor" ]; then

    # echo ""
    StringForChecked=$( echo "$StringFor" | grep -Poz "\b(while)\b\s+\[\s.*\s\](?!(?=do))\s*;?\s*\bdo\b(?!(?=\s+done)).*(?(?=\n)\s+|.+)+?\bdone\b" | tr -d '\0' > out.txt)     
    StringForChecked=$(cat "out.txt")   
    # echo ""
    # echo "$StringForChecked"
    # echo "unfiltered $StringFor"
    # echo "filtered $StringForChecked"
    # echo ""

    if [ -z "$StringForChecked" ]; then
    
        # echo ""     
        echo "--> There is error in While Loop : " >> result.txt
        echo  "$StringFor" >> result.txt
        echo "" >> result.txt
   
    else

        # echo ""
        echo "--> There is no error in While conditional " >> result.txt
         echo "" >> result.txt
    
    fi
    
fi

