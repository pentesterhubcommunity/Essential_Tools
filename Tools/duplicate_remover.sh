#!/bin/bash

# Prompt user for the target file
read -p "Enter the path to the target file: " file_path

# Check if the file exists
if [ ! -f "$file_path" ]; then
    echo "Error: File not found!"
    exit 1
fi

# Remove duplicate lines and overwrite the original file
awk '!seen[$0]++' "$file_path" > "$file_path.tmp" && mv "$file_path.tmp" "$file_path"

echo "Duplicate lines removed from $file_path"

