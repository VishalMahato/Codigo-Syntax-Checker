#!/usr/bin/env bash


read -p "Enter the name of the shell script file: " FILE_NAME
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

# ./check_quotes.sh $FILE
