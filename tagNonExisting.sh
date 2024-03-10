 #!/bin/bash

# Check if two arguments were provided
if [ $# -ne 2 ]; then
    echo "Usage: $0 [filepath A] [filepath B]"
    exit 1
fi

# Extract the directory paths and check if they exist
dirA=$(dirname "${1%/}")
dirB=$(dirname "${2%/}")
if [ ! -d "$dirA" ]; then
    echo "Error: $dirA is not a valid directory"
    exit 1
fi
if [ ! -d "$dirB" ]; then
    echo "Error: $dirB is not a valid directory"
    exit 1
fi

# If the input paths contain a slash, use the input paths as directory paths
if [ "$dirA" = "." ]; then
    dirA=$(basename "$1")
fi
if [ "$dirB" = "." ]; then
    dirB=$(basename "$2")
fi

echo "Dir A: $dirA"
echo "Dir B: $dirB"

# Find all files in dirA
all_files=$(find "$dirA")

# Check if there are any yellow files
if [ -z "$all_files" ]; then
    echo "No files found in $dirA"
    exit 0
fi

# Tag orange files in filepath B that have the same name (without extension) as any yellow file
find "$dirB" -type f -print0 | while read -d $'\0' file; do
    filename=$(basename "$file")
    name=$(echo "$filename" | cut -f 1 -d '.')
    if ! echo "$all_files" | grep -q "$name"; then
        osascript -e "tell application \"Finder\" to set label index of (POSIX file \"$file\" as alias) to 7"
        echo "Tagged $filename in $dirB"
    fi
done
