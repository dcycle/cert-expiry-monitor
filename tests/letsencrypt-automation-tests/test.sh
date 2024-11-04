#!/bin/bash

# bash script to test letsencrypt output automation.

# You can run as below:-
# /tests/letsencrypt-automation-tests/test.sh

# Function to check if a string exists in a file
check_string_in_file() {
  local file="$1"
  local search_string="$2"

  # Check if the file exists
  if [[ ! -f "$file" ]]; then
    echo "File $file does not exist."
    return 1
  fi

  # Search for the string in the file
  if grep -q "$search_string" "$file"; then
    echo "The string was found in $file."
    return 0
  else
    echo "The string was not found in $file."
    return 1
  fi
}

# Function to empty a file if it exists
empty_file_if_exists() {
    local FILE="$1"

    if [[ -e $FILE ]]; then
        echo "" > "$FILE"  # Empty the file
    fi
}

SCRIPT_PATH="./script/modules/letsencrypt-automation/convert-output-to-commands.sh"

run_test_case_1() {
  echo "================================test-case-1========================================="

  # create empty file.
  FILE_PATH="./unversioned/test1-expected-dest.txt"
  empty_file_if_exists "$FILE_PATH"
  # create empty file.
  FILE_PATH="./unversioned/test1-expected-dest.txt"
  empty_file_if_exists "$FILE_PATH"
  # create empty file.
  FILE_PATH="./unversioned/test1-source.txt"
  empty_file_if_exists "$FILE_PATH"

  echo "
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
Create a file containing just this data:

example_file.txt

And make it available on your web server at this URL:

http://example.com/.well-known/acme-challenge/example_file.txt

- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
Press Enter to Continue
  " >> ./unversioned/test1-source.txt

  echo "mkdir -p ./docroot/.well-known/acme-challenge
  echo example_file.txt > ./docroot/.well-known/acme-challenge/example_file.txt
  " >> ./unversioned/test1-expected-dest.txt

  $SCRIPT_PATH \
  ./unversioned/test1-source.txt ./unversioned/test1-actual-dest.txt \
  ./unversioned/test1-actual-test.txt ./docroot


  # Define the file and string to search for
  FILE="./unversioned/test1-actual-test.txt"  # Replace with your actual file name
  SEARCH_STRING='curl -L "http://example.com/.well-known/acme-challenge/example_file.txt?cache-buster='

  # Call the function
  if check_string_in_file "$FILE" "$SEARCH_STRING"; then
    echo "Test case 1 passed."
    return 0  # Return success
  else
    echo "Test case 1 failed."
    return 1  # Return failure
  fi
}

run_test_case_2() {
  echo "================================test-case-2========================================="

  # create empty file.
  FILE_PATH="./unversioned/test2-expected-dest.txt"
  empty_file_if_exists "$FILE_PATH"
  # create empty file.
  FILE_PATH="./unversioned/test2-expected-dest.txt"
  empty_file_if_exists "$FILE_PATH"
  # create empty file.
  FILE_PATH="./unversioned/test2-source.txt"
  empty_file_if_exists "$FILE_PATH"

  echo "
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
Create a file containing just this data:

file_one.txt

And make it available on your web server at this URL:

http://example.com/.well-known/acme-challenge/file_one.txt

Create a file containing just this data:

file_two.txt

And make it available on your web server at this URL:

http://example.com/.well-known/acme-challenge/file_two.txt
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -" >> ./unversioned/test2-source.txt

  echo "mkdir -p ./docroot/.well-known/acme-challenge
echo file_one.txt > ./docroot/.well-known/acme-challenge/file_one.txt
echo file_two.txt > ./docroot/.well-known/acme-challenge/file_two.txt" >> ./unversioned/test2-expected-dest.txt

  $SCRIPT_PATH \
    ./unversioned/test2-source.txt ./unversioned/test2-actual-dest.txt  \
    ./unversioned/test2-actual-test.txt ./docroot


  # Define the file and string to search for
  FILE="./unversioned/test2-actual-test.txt"  # Replace with your actual file name
  SEARCH_STRING2='curl -L "http://example.com/.well-known/acme-challenge/file_one.txt?cache-buster='

  # Call the function
  check_string_in_file "$FILE" "$SEARCH_STRING1"

  # Call the function
  if check_string_in_file "$FILE" "$SEARCH_STRING1"; then
    echo "Test case 2.1 passed."
  else
    echo "Test case 2.1 failed."
    return 1  # Return failure
  fi

  SEARCH_STRING2='curl -L "http://example.com/.well-known/acme-challenge/file_two.txt?cache-buster='
  check_string_in_file "$FILE" "$SEARCH_STRING2"

  # Call the function
  if check_string_in_file "$FILE" "$SEARCH_STRING2"; then
    echo "Test case 2.2 passed."
    return 0  # Return success
  else
    echo "Test case 2.2 failed."
    return 1  # Return failure
  fi
}


# Function for Insufficient Arguments Test
run_test_case_3() {
    echo "Running Insufficient Arguments Test..."

    # Execute the script with insufficient arguments
    OUTPUT=$($SCRIPT_PATH ./unversioned/test3-source.txt ./unversioned/test5-dest.txt 2>&1)
    EXIT_STATUS=$?  # Capture the exit status immediately

    # Check the output for the expected usage message and exit status
    if [[ $OUTPUT == "Usage: ./script/modules/letsencrypt-automation/convert-output-to-commands.sh source.txt dest.txt test.txt docroot" ]] && [[ $EXIT_STATUS -eq 1 ]]; then
        echo "Insufficient Arguments Test Passed"
        return 0
    else
        echo "Insufficient Arguments Test Failed"
        echo "$OUTPUT"
        return 1
    fi
}

# Function for Invalid Format Test
run_test_case_4() {
    echo "Running Invalid Format Test..."
    echo "This is not a valid format" > ./unversioned/test4-source.txt
    OUTPUT=$($SCRIPT_PATH ./unversioned/test5-source.txt ./unversioned/test5-dest.txt ./unversioned/test5-test.txt ./docroot 2>&1)
    EXIT_STATUS=$?  # Capture the exit status immediately

    # Check for the specific error message
    if [[ $OUTPUT == "An error occurred or files are empty." ]]  && [[ $EXIT_STATUS -eq 0 ]]; then
        echo "Invalid Format Test Passed"
        return 0
    else
        echo "Invalid Format Test Failed"
        echo "$OUTPUT"
        return 1
    fi
}

# Function for Empty Source File Test
run_test_case_5() {
    echo "Running Empty Source File Test..."
    echo "" > ./unversioned/test5-source.txt  # Create an empty source file
    OUTPUT=$($SCRIPT_PATH ./unversioned/test5-source.txt ./unversioned/test5-dest.txt ./unversioned/test5-test.txt ./docroot 2>&1)

    # Check for the specific error message
    if [[ $OUTPUT == "An error occurred or files are empty." ]]; then
        echo "Empty Source File Test Passed"
        return 0
    else
        echo "Empty Source File Test Failed"
        echo "$OUTPUT"
        return 1
    fi
}

# Array of test case functions
test_cases=(run_test_case_1 run_test_case_2 run_test_case_3 run_test_case_5)

# Run test cases sequentially
for test_case in "${test_cases[@]}"; do
    if ! "$test_case"; then
        exit 1  # Stop execution on failure
    fi
done

echo "------------ All letsencrypt automation tests executed successfully-------------"
