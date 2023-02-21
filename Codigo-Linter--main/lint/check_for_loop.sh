#!/usr/bin/env bash
# echo "hi"
stringg=$(cat $FILE)
StringFor=$(echo "$stringg"| grep -Poz "for\b(\s*|.+){1,}\bdone")

echo "hey"
if [ -n "$StringFor" ]; then
    echo ""
    # echo "$StringFor"
   
   
    
    StringForChecked=$(echo "$StringFor" | grep -Poz "\bfor\b\s*(\(\()+.+(\)\));?\s*(\bdo\b)\s+(.|\s)+\b(done)\b" | tr -d '\0' >out.txt)
    # echo "a = $StringFor"
    # echo "$FIL"
    StringForChecked=$(cat out.txt)
    #  echo "filtered $StringForChecked"
 

    echo ""
    if [ -z "$StringForChecked" ]; then
    echo ''
    
        echo "There is error in : For Loop "
        echo  "$StringFor"
        echo ""
    else
         echo "There is no error in For Loop "
        # echo  "$StringFor"
        echo ""
        
    fi
else
    echo "no for loop caught"
fi


# for\s*(\(\()+.+(\)\));\s*\bdo\b\s+(.|\s)+\b(done)\b






