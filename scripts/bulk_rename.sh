#!/bin/bash

read -t 10 -p "Enter a phrase: " phrase
count=0
for file in *.png; do
    mv "$file" "${phrase}_${count}.png"
    count=$((count+1))
done
for file in *.jpeg; do
    mv "$file" "${phrase}_${count}.jpeg"
    count=$((count+1))
done
for file in *.jpg; do
    mv "$file" "${phrase}_${count}.jpg"
    count=$((count+1))
done
for file in *.webp; do
    mv "$file" "${phrase}_${count}.webp"
    count=$((count+1))
done

# TODO: 
# use xargs -i touch {}.png etc to rename the files
