#!/usr/bin/env bash
echo "" > result.txt
FIL=$FILE
FIL=$( echo "$FIL" | tr -d '\0')
StringFor=$( echo "$FIL" | grep -Poz "\bfor\b(\s*|.+){1,}\bdone" | tr -d '\0' > out.txt)
# (\bfor\b\s+([a-zA-Z0-9])+\s(in)+((\s(\{.+\})+(\s?;))|(\s*(\$)+(\(.+\)+(\s?;)))))
StringFor=$(cat "out.txt")

if [ -n "$StringFor" ]; then
    
    echo ""
    StringForChecked=$( echo "$StringFor" | grep -Poz "\bfor\s*(\(\()+.+(\)\));?\s*\bdo\b\s+(.|\s)+\b(done)\b\n" | tr -d '\0' > out.txt)
    # StringForChecked=$( echo "$StringFor" | grep -Poz "(\bfor\s*(\(\()+.+(\)\));?\s*|(\bfor\b\s*([a-zA-Z0-9])+\s(in)+((\s(\{.+\})+(\s?;))|(\s*(\$)+(\(.+\)+(\s?;))))))\s*\bdo\b\s+(.|\s)+\b(done)\b" | tr -d '\0' > out.txt)
    StringForChecked=$( cat out.txt)
    
    if [ -z "$StringForChecked" ]; then
        
        {
        echo '--> There is error in : For Loop' 
        echo "$StringFor" 
        echo ""
        } >> result.txt
        
    else
        
        { 
        echo "--> There is no error in : For Loop " 
        echo "" 
        } >> result.txt
        
    fi
    
fi

