#!/bin/bash

# Check for required input
if [ $# -ne 2 ]; then
    echo "Usage: $0 <word_to_search> <file>"
    exit 1
fi

# Grep and sort
grep -i "$1" "$2" | sort
