#!/bin/bash

#Ensure the target directory exists
if [ !-d"organized"];then
    mkdir "organized_files"
fi

#Organize files based on their extensions
for file in*;do
    if [-f"$file"];then
        extension="${file##*.}"
        destination="organized/$extension"

            if [ !-d"$destination"];then
            mkdir "$destination"
        fi
            mv "$file" "destination"
    fi
done