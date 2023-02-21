#!/usr/bin/env bash
# $(bash -n $FILE 2>&1 out.txt)
# echo "check_quotes"
# StringFor=$(cat out.txt | grep -Pi "unexpected EOF while looking for matching")

# if [ -n "$StringFor" ]; then
#     echo ""
    
#     echo "There is error in Usage of Quotes : "
#     echo  "$StringFor"
#     echo ""
        
# else
#     printf "there is no error in IF conditional "
# fi
# kill $$
# for\s*(\(\()+.+(\)\));\s*\bdo\b\s+(.|\s)+\b(done)\b


# Check if the file exists

  # Check the syntax of the shell script
  echo "$FILE"
  export FILE=$1
if [[ -z $FILE ]]; then
    echo 'not present'
    exit 0
    
    
fi
ERRORS=$(bash -n $FILE 2>&1)
# echo "error - $ERRORS"
StringFor=$(echo $ERRORS| grep -Poi "unexpected EOF while looking for matching")
# echo "filtered string - $StringFor"
if [ -n "$StringFor" ]; then
    # If there are errors, print them to the console
    echo "Syntax errors in $FILE:"
    echo "$StringFor Quote"
else
    # If there are no errors, print a success message
    echo "$FILE has no Incorrect Usage of quotes"
fi
