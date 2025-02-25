#!/bin/bash


BASE_DIR="$(pwd)"
ORGANIZED_DIR="$BASE_DIR/organized"
TEST_FILES_DIR="$BASE_DIR/test-files"

# Define category mapping
declare -A categories
categories=(
    ["pdf"]="Documents"
    ["docx"]="Documents"
    ["txt"]="Documents"
    ["jpg"]="Images"
    ["jpeg"]="Images"
    ["png"]="Images"
    ["gif"]="Images"
    ["mp4"]="Videos"
    ["mkv"]="Videos"
    ["avi"]="Videos"
    ["mp3"]="Music"
    ["wav"]="Music"
    ["flac"]="Music"
    ["zip"]="Archives"
    ["tar.gz"]="Archives"
    ["rar"]="Archives"
    ["sh"]="Scripts"
    ["py"]="Scripts"
    ["js"]="Scripts"
)

# Ensure the target directory exists
if [ ! -d "$ORGANIZED_DIR" ]; then
    mkdir "$ORGANIZED_DIR"
fi

for folder in Documents Images Videos Music Archives Scripts Others; do
    if [ ! -d "$ORGANIZED_DIR/$folder" ]; then
        mkdir "$ORGANIZED_DIR/$folder"
    fi
done

# Organize files based on their extensions
for file in "$TEST_FILES_DIR"/*; do
    if [ -f "$file" ]; then
        filename=$(basename "$file")
        extension="${filename##*.}"
        extension=$(echo "$extension" | tr '[:upper:]' '[:lower:]')

        dest_category="${categories[$extension]}"


        if [ ! -z "$dest_category" ]; then
            dest_category="others"
        fi

        destination="$ORGANIZED_DIR/$dest_category"

        echo "Moving '$filename' to '$destination'"
        mv "$file" "$destination"
    fi
done
