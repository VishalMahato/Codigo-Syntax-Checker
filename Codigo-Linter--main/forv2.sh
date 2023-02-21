#!/usr/bin/env bash


FIL=$FILE
FIL=$( echo "$FIL" | tr -d '\0')
StringFor=$( echo "$FIL" | grep -Poz "\bfor\b(\s*|.+){1,}?\bdone\n" |tr -d '\0' > out.txt) 
StringFor=$(cat "out.txt")


if [ -n "$StringFor" ]; then
    echo ""
    
    
    StringForChecked=$( echo "$StringFor" | grep -Pozv "\bfor\s*(\(\()+.+(\)\));?\s*\bdo\b\s+(.|\s)+?\b(done)\b\n" | tr -d '\0' > out1.txt)

    
    StringForChecked=$(cat "out1.txt" )
    


    echo ""
    len1=$( cat "out.txt" | wc -l )
    len2=$( cat "out1.txt" | wc -l )
    echo "${len1}"
    echo "${len2}"
    echo ""
    
  
    
     if [ -n "$StringForChecked" ]; then
        echo ""
        echo "There is error in : For Loop "
        echo  "$StringForChecked"
        echo ""
   
    else
        echo ""
        echo "There is no error in : For Loop "
        echo ""
        exit 0
    fi
else 
    echo ""
    echo 'no for loop'
    echo ""

    
fi








