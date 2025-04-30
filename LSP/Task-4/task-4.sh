#!/bin/bash

# Function to count lines in a file
count_lines() {
    local file=$1
    if [ -f "$file" ]; then
        echo "$file has $(wc -l < "$file") lines."
    else
        echo "$file does not exist."
    fi
}

# File list
files=("file1.txt" "file2.txt" "file3.txt")

# Loop through the files and call the function
for file in "${files[@]}"; do
    count_lines "$file"
done
