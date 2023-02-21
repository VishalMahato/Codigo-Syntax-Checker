#!/usr/bin/env bash
var=$( cat "out.txt")
grep -v "$var" out1.txt > tem.txt && mv tem.txt out1.txt
cat "out1.txt"