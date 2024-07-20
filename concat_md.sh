#!/bin/bash

# Check if a directory argument is provided
if [ $# -eq 0 ]; then
  echo "Usage: $0 <directory> [output_file]"
  exit 1
fi

# Directory to search for .md files
directory=$1

# Optional: Output file name (default to concatenated.md)
output_file=${2:-concatenated.md}

# Ensure the output file is empty before appending
> "$output_file"

# Find all .md files in the specified directory and concatenate them
find "$directory" -type f -name "*.md" -exec cat {} + >> "$output_file"

echo "All .md files have been concatenated into $output_file"
