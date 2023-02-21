#!/usr/bin/env bash

item=2
case "${item}" in
    1 )echo "item = 1"
    ;;
    2|3)
        echo "item = 2 or item = 3"
    ;;
    *)
        echo "default (none of above)"
    ;;
esac
# (\bcase\b\s+.+\bin\b(\s*|.+))?+([a-zA-Z0-9]+\s*\)(.+|\s*)+?(;;))+\s+([*]+\s*\)(.+|\s*)+?(;;))+\s+\b(esac)\b