#!/bin/bash

# bash script to create commands from letsencrypt output.

# You can run as below:-
# cd script/modules/letsencrypt-automation
# % ./convert-output-to-commands.sh ../../../unversioned/source.txt ../../../unversioned/dest.txt ../../../unversioned/test.txt ./docroot

# Check the number of arguments
if [ "$#" -ne 4 ]; then
    echo "Usage: $0 source.txt dest.txt test.txt docroot"
    exit 1
fi

SOURCE_FILE="$1"
DEST_FILE="$2"
TEST_FILE="$3"
DOCROOT="$4"

# Clear the destination and test files
echo "" > "$DEST_FILE"
echo "" > "$TEST_FILE"

# Add the directory creation command to dest.txt
echo "mkdir -p $DOCROOT/.well-known/acme-challenge" >> "$DEST_FILE"

# Generate a random cache-buster value
CACHE_BUSTER=$((RANDOM % 9999 + 1))

# Process the source file. Read lines of source.txt one by one.
while IFS= read -r line; do
    # Trim trailing whitespace
    line="${line%"${line##*[![:space:]]}"}"

    # Match the line containing the file data
    if [[ $line == "Create a file containing just this data:"* ]]; then
        read -r empty_line  # Read the next line (which should be empty)
        read -r FILENAME    # Read the filename on the following line

        # Append to dest.txt
        echo "echo '$FILENAME' > $DOCROOT/.well-known/acme-challenge/${FILENAME%%.*}" >> "$DEST_FILE"
    fi

    # Match the line containing the URL
    if [[ $line == "And make it available on your web server at this URL:"* ]]; then
        read -r empty_line  # Read the next line (which should be empty)
        read -r URL        # Read the URL on the following line

        # Append to test.txt with the generated cache-buster value
        echo "curl -L \"$URL?cache-buster=$CACHE_BUSTER\"" >> "$TEST_FILE"
    fi
done < "$SOURCE_FILE"

# Check if both files have been written
if [[ -s "$DEST_FILE" && -s "$TEST_FILE" ]]; then
    echo "Commands written to $DEST_FILE and $TEST_FILE."
else
    echo "An error occurred or files are empty."
fi
