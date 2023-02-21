

stringg=$FILE
StringFor=$( echo "$stringg"| grep -Poz "for\b(\s*|.+){1,}\bdone" | tr -d '\0' > out.txt)


if [ -n "$StringFor" ]; then
    echo ""
    
    StringForChecked=$( echo "$StringFor" | grep -Poz "\bfor\b\s*(\(\()+.+(\)\));?\s*(\bdo\b)\s+(.|\s)+\b(done)\b" | tr -d '\0' > out.txt)
    StringForChecked=$( cat "out.txt")
  
 

    echo ""
    if [ -z "$StringForChecked" ]; then
    echo ''
    
        echo "There is error in : For Loop "
        echo  "$StringFor"
        # echo ""
    else
        # echo""
        echo "There is no error in For Loop "
        # echo ""
        
    fi
else
    echo""
    echo "no for loop caught"
    echo""
fi





