#!/bin/bash

#images
find . -type f \( -iname \*.jpg -o -iname \*.jpeg -o -iname \*.png \) -exec sh -c '
for file do
    dir=$(dirname "$file")
    mkdir -p "$dir/images"
    mv "$file" "$dir/images/"
done
' sh {} +