#!/bin/bash
# executing CLI 
read -p "Enter the name of the shell script file: " FILE_NAM
export FILE_NAAM=$FILE_NAM
FILE_NAME=$(sed '/^#/d' "$FILE_NAM")
export FILE=$FILE_NAME
# pcre limit
# SecPcreMatchLimit 250000
# SecPcreMatchLimitRecursion 250000
# Check if the file exists
# echo $FILE

if [ -n "$FILE" ]; then
  
  # Check the syntax of the shell script
  echo "started matching"
  # echo "$FILE"

else

  # If the file does not exist, print an error message
  echo "File not found: $FILE"

fi

# ./check_quotes.sh $FILE
#working checks
./for.sh
./if.sh
./while.sh
./check_case_conditional.sh
 ./check_quotes.sh
#not working checks


# echo $FILE
# ./check_quotes.sh

# ./p1.sh
# ./forv2.sh
# ./ifv2.sh