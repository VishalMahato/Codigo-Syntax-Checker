#!/usr/bin/env bash

ERRORS=$( bash -n "$FILE_NAAM" 2>&1  )
cat "temp.txt"
# echo "ERROR -
# $ERRORS"
StringFor=$(echo $ERRORS| grep -Poi "unexpected EOF while looking for matching")

if [ -n "$StringFor" ]; then

    # echo ""
    { 
    echo "--> Syntax errors in FILE:"
        echo "$StringFor Quote" 
    echo "" 
    } >> result.txt

else

    # echo ""
    { 
    echo "--> FILE has correct Usage of quotes"  
    echo ""
    }   >> result.txt
fi