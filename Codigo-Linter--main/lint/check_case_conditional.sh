#!/bin/bash
FIL=$(cat $FILE | tr -d '\0')
StringFor=$(echo "$FIL" | grep -Poz "\bcase\b(\s*|.+)+\besac\b" | tr -d '\0' >out.txt)
# echo "a = $StringFor"
# echo "$FIL"
StringFor=$(cat out.txt)
if [ -n "$StringFor" ]; then
 
  
    StringForChecked=$(echo "$StringFor" | grep -Pozq "(\bcase\b\s+.+\bin\b(\s*|.+))+([a-zA-Z0-9|*]+\s*\)(.+|\s*)+?(;;))+\s+\b(esac)\b") 

    
    if [ -z "$StringForChecked" ]; then
         
        echo "There is error in : "
        echo "$StringFor"
        echo ""
        
   
    else
         printf "there is no error in CASE conditional "
    fi

else 
  echo "case conditional not caught"
  
    
fi

# for\s*(\(\()+.+(\)\));\s*\bdo\b\s+(.|\s)+\b(done)\b