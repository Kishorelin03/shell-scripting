#!/bin/bash

# Check if directory argument is given
if [ -z "$1" ]; then
    echo "Usage: $0 /path/to/directory"
    exit 1
fi

# Target directory
target_dir="$1"

# Check if the directory exists
if [ ! -d "$target_dir" ]; then
    echo "Error: Directory '$target_dir' not found."
    exit 1
fi

# Process all .txt files
echo "Analyzing .txt files in: $target_dir"
echo ""

for file in "$target_dir"/*.txt; do
    if [ -f "$file" ]; then
        echo "File: $(basename "$file")"
        wc "$file"
        echo ""
    fi
done

