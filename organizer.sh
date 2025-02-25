#!/bin/bash

#images
find . -type f \( -iname \*.jpg -o -iname \*.jpeg -o -iname \*.png -o -iname \*.gif \) -exec sh -c '
for file do
    dir=$(dirname "$file")
    mkdir -p "$dir/images"
    mv "$file" "$dir/images/"
done
' sh {} +

#videos
find . -type f \( -iname \*.mkv -0 -iname \*.mp4 -o -iname \*.avi \) -exec sh -c '
for file do
    dir=$(dirname "$file")
    mkdir -p "$dir/Videos"
    mv "$file" "$dir/Videos/"
done
' sh {} +