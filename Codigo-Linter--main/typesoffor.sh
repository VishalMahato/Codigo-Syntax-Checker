#!/usr/bin/env bash
for((i=0;i<n;i++)); do
    echo "${i}"
done
for((i=0;i<n;i++)); do
    for((j=0;j<m;j++)); do
        echo "${i}, ${j}"
    done
done

for item in {"Hello World!",a,bc,1372}; do
    echo "${item}"
done

for item in {a..z}; do
    echo "${item}"
done
for col in $(docker images | awk '{ print $1":"$2 }'); do
    echo "${col}" | cut -d ':' -f 1
    echo "${col}" | cut -d ':' -f 2
done


