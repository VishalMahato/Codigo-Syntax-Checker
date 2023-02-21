#!/usr/bin/env bash

stringg=$FILE
StringFor=$(echo "$stringg"| grep -Pvz "^((?:[^()]+|\((?1)?\))*)$")


if [ -n "$StringFor" ]; then
    echo ""
    echo "no Error in paranthesis "
    echo ""

else
    echo ""
    echo "Error in paranthesis"
    echo ""
fi


# 





