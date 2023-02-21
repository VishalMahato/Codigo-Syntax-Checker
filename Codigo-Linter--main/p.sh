#!/usr/bin/env bash

FIL=$FILE
FIL=$( echo "$FIL" | tr -d '\0')


Filtered=$( echo "$FIL" | grep -Pvz "^((?:[^()]+|\((?1)?\))*)$" | tr -d '\0' > out.txt)
# Filtered=$( echo "$FIL" | grep -vz "^([^()]*|\(([^()]*|\(([^()]*|\(([^()]*|\(([^()]*|\(([^()]*|\(([^()]*|\(([^()]*|\(([^()]*|\(([^()]*|\(([^()]*|\(([^()]*|\(([^()]*|\(([^()]*|\(([^()]*|\(([^()]*|\(([^()]*|\(([^()]*|\(([^()]*|\(([^()]*|\(([^()]*|\(([^()]*|\(([^()]*|\(([^()]*|\(([^()]*|\([^()]*\))*\))*\))*\))*\))*\))*\))*\))*\))*\))*\))*\))*\))*\))*\))*\))*\))*\))*\))*\))*\))*\))*\))*\))*\))*\))*$" )
Filtered=$(cat "out.txt")

# StringFor=$( cat "out.txt")
echo "$Filtered"


if [ -n "$Filtered" ]; then
    echo ""
    # echo "$StringFor"
    echo "Error in paranthesis "

else
    echo " No Error in paranthesis"
fi