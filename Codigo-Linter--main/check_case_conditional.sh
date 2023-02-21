#!/bin/bash
FIL=$FILE
FIL=$( echo "$FIL" | tr -d '\0')
StringFor=$( echo "$FIL" | grep -Poz "\bcase\b(?:\s+|.+)+?\besac\b" | tr -d '\0' > out.txt) 
# StringFor=$(echo "$FIL" | grep -Poz "\bcase\b(\s*|.+)+\besac\b")
StringFor=$(cat "out.txt")

if [ -n "$StringFor" ]; then

  # echo ""
  StringForChecked=$( echo "$StringFor" | grep -Poz "(\bcase\b\s+.+\s+?\bin\b(?:\s*|.+)?(?:[a-zA-Z0-9*]+\s*\)(?:.+|\s*)+?(?:;;))+\s+\besac\b)" | tr -d '\0' > out.txt) 
  StringForChecked=$(cat "out.txt")
  # echo "$StringForChecked"
  if [ -z "$StringForChecked" ]; then
         
       {  # echo "" 
        echo "--> There is error in : " 
        echo "$StringFor"
        echo "" 
      } >> result.txt

  else

        {
         echo "--> There is no error in CASE conditional " 
         echo "" 
        } >> result.txt
        

    fi

# else 

#   echo "" >> result.txt
#   echo "case conditional not caught"
#   echo ""
    
fi

