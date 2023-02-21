#!/usr/bin/env bash
i=1
# Loop through columns
for((j=1;j<=n;j++);do
    
    if [ $(((i+j)%2)) -eq 0 ] then
        # echo -e -n "\\e[40m "
        echo " "
    else
        # echo -e -n "\\e[47m "
        echo " "
    fi
    echo ""
done


while [ true ] ;do
    # body
    echo 'text here'
    exit 0
    
    
done
case "${item}" in
    1)
        echo "item = 1"
    ;;
    2|3)
        echo "item = 2 or item = 3"
    ;;
    *)
        echo "default (none of above)"
    ;;
esac   

