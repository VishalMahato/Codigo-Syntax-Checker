#!/usr/bin/env bash

# executing CLI 
read -p "Enter the name of the shell script file: " FILE_NAM
FILE_NAME=$(sed '/^#/d' "$FILE_NAM")

export FILE=$FILE_NAME


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
echo "file --
+++++++++++++++++++++++++++++++++++++++++++++++++++++
$FILE_NAME
"

# ./check_quotes.sh $FILE


#checks
# ./check_for_loop.sh
# ./check_if_conditional.sh
# ./check_while_loop.sh
# ./check_case_conditional.sh
# echo $FILE
# ./check_quotes.sh
