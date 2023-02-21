#!/usr/bin/env bash
i=1
# Loop through columns
for((j=1;j<=n;j++))
do
# Print a black box for even rows and columns
if [ $(((i+j)%2)) -eq 0 ] then
    echo -e -n "\\e[40m "
else
    echo -e -n "\\e[47m "
fi
  echo
done


while [ true ]; do
    # body
    echo 'text here'
    exit 0
    
done

