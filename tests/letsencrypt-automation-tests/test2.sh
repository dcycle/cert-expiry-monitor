#!/bin/bash

# bash script to test letsencrypt output automation.

# You can run as below:-
# cd tests/letsencrypt-automation-tests/
# % ./test.sh

# Function to print error messages in red
print_error() {
  echo -e "\e[31m$1\e[0m"  # Red text
}


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
        > "$FILE"  # Empty the file
        # echo "File '$FILE' has been emptied."
    else
        echo "File '$FILE' does not exist."
    fi
}

run_test_case_1() {

  echo "================================test-case-1========================================="
  # create empty file.
  FILE_PATH="./unversioned/test1-expected-dest.txt"
  empty_file_if_exists "$FILE_PATH"
  # create empty file.
  FILE_PATH="./unversioned/test1-expected-dest.txt"
  empty_file_if_exists "$FILE_PATH"
  # create empty file.
  FILE_PATH=" ./unversioned/test1-source.txt"
  empty_file_if_exists "$FILE_PATH"

  # Setup files and directories
  echo "- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  Create a file containing just this data:

  example_file.txt

  And make it available on your web server at this URL:

  http://example.com/.well-known/acme-challenge/example_file.txt

  - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  Press Enter to Continue

  - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  Create a file containing just this data:
  " >> ./unversioned/test1-source.txt


  echo "mkdir -p ./docroot/.well-known/acme-challenge
  echo example_file.txt > ./docroot/.well-known/acme-challenge/example_file.txt
  " >> ./unversioned/test1-expected-dest.txt

  if ! ./script/modules/letsencrypt-automation/convert-output-to-commands.sh \
  ./unversioned/test1-source.txt ./unversioned/test1-actual-dest.txt \
  ./unversioned/test1-actual-test.txt ./docroot; then
    echo "Error: Conversion script failed."
    exit 1
  fi

  # Define the file and string to search for
  FILE="./unversioned/test1-actual-test.txt"
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

# run_test_case_2() {
#   echo "================================test-case-2========================================="
  
#   # Setup files and directories
#   echo "- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
#   Create a file containing just this data:

#   file_one.txt

#   And make it available on your web server at this URL:

#   http://example.com/.well-known/acme-challenge/file_one.txt

#   - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
#   Create a file containing just this data:

#   file_two.txt

#   And make it available on your web server at this URL:

#   http://example.com/.well-known/acme-challenge/file_two.txt
#   - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -" >> ./unversioned/test2-source.txt

#   echo "mkdir -p ./docroot/.well-known/acme-challenge
#   echo file_one.txt > ./docroot/.well-known/acme-challenge/file_one.txt
#   echo file_two.txt > ./docroot/.well-known/acme-challenge/file_two.txt
#   " >> ./unversioned/test2-expected-dest.txt

#   if ! ./script/modules/letsencrypt-automation/convert-output-to-commands.sh \
#   ./unversioned/test2-source.txt ./unversioned/test2-actual-dest.txt \
#   ./unversioned/test2-actual-test.txt ./docroot; then
#     echo "Error: Conversion script failed."
#     exit 1
#   fi

#   # Define the file and string to search for
#   FILE="./unversioned/test2-actual-test.txt"
#   SEARCH_STRING='curl -L "http://example.com/.well-known/acme-challenge/file_two.txt?cache-buster='

#   # Call the function
#   if check_string_in_file "$FILE" "$SEARCH_STRING"; then
#     echo "Test case 2 passed."
#     return 0  # Return success
#   else
#     echo "Test case 2 failed."
#     return 1  # Return failure
#   fi

# }

# Run the test cases sequentially
if ! run_test_case_1; then
  exit 1  # Stop execution on failure
fi

# if ! run_test_case_2; then
#   exit 1  # Stop execution on failure
# fi

# if ! run_test_case_3; then
#   exit 1  # Stop execution on failure
# fi

echo "------------ All letsencrypt automation tests executed successfully-------------"




# #!/bin/bash

# # bash script to test letsencrypt output automation.

# # You can run as below:-
# # cd tests/letsencrypt-automation-tests/
# # % ./test.sh

# # Function to check if a string exists in a file
# check_string_in_file() {
#   local file="$1"
#   local search_string="$2"

#   # Check if the file exists
#   if [[ ! -f "$file" ]]; then
#     echo "File $file does not exist."
#     return 1
#   fi

#   # Search for the string in the file
#   if grep -q "$search_string" "$file"; then
#     echo "The string was found in $file."
#     return 0
#   else
#     echo "The string was not found in $file."
#     return 1
#   fi
# }


# echo "================================test-case-1========================================="

# echo "- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Create a file containing just this data:

# example_file.txt

# And make it available on your web server at this URL:

# http://example.com/.well-known/acme-challenge/example_file.txt
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -" >> ./unversioned/test1-source.txt

# echo "mkdir -p ./docroot/.well-known/acme-challenge
# echo example_file.txt > ./docroot/.well-known/acme-challenge/example_file.txt
# " >> ./unversioned/test1-expected-dest.txt

# ./script/modules/letsencrypt-automation/convert-output-to-commands.sh \
# ./unversioned/test1-source.txt ./unversioned/test1-actual-dest.txt \
# ./unversioned/test1-actual-test.txt ./docroot


# # Define the file and string to search for
# FILE="./unversioned/test1-actual-test.txt"  # Replace with your actual file name
# SEARCH_STRING='curl -L "http://example.com/.well-known/acme-challenge/example_file.txt?cache-buster='

# # Call the function
# check_string_in_file "$FILE" "$SEARCH_STRING"

# echo "=====================================****==============================================="

# # echo "================================test-case-2========================================="

# echo "- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Create a file containing just this data:

# file_one.txt

# And make it available on your web server at this URL:

# http://example.com/.well-known/acme-challenge/file_one.txt

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Create a file containing just this data:

# file_two.txt

# And make it available on your web server at this URL:

# http://example.com/.well-known/acme-challenge/file_two.txt
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -" >> ./unversioned/test2-source.txt

# echo "mkdir -p ./docroot/.well-known/acme-challenge
# echo file_one.txt > ./docroot/.well-known/acme-challenge/file_one.txt
# echo file_two.txt > ./docroot/.well-known/acme-challenge/file_two.txt
# " >> ./unversioned/test2-expected-dest.txt

# # ./script/modules/letsencrypt-automation/convert-output-to-commands.sh \
# #   ./unversioned/test2-source.txt ./unversioned/test2-actual-dest.txt  \
# #   ./unversioned/test2-actual-test.txt ./docroot


# # # Define the file and string to search for
# # FILE="./unversioned/test2-actual-test.txt"  # Replace with your actual file name
# # SEARCH_STRING1='curl -L "http://example.com/.well-known/acme-challenge/file_one.txt?cache-buster='

# # # Call the function
# # check_string_in_file "$FILE" "$SEARCH_STRING1"

# # SEARCH_STRING2='curl -L "http://example.com/.well-known/acme-challenge/file_two.txt?cache-buster='
# # check_string_in_file "$FILE" "$SEARCH_STRING2"

# # echo "======================================***=============================================="

# # echo "================================test-case-3========================================="
# # echo "xxx" >> ./unversioned/test3-expected-dest.txt

# # ./script/modules/letsencrypt-automation/convert-output-to-commands.sh \
# #   ./unversioned/test3-source.txt ./unversioned/test3-actual-dest.txt  \
# #   ./unversioned/test3-actual-test.txt ./docroot
# # echo "===================================================================================="

# # echo "================================test-case-4========================================="
# # echo "xxx" >> ./unversioned/test4-expected-dest.txt

# # ./script/modules/letsencrypt-automation/convert-output-to-commands.sh \
# #   ./unversioned/test4-source.txt ./unversioned/test4-actual-dest.txt  \
# #   ./unversioned/test4-actual-test.txt ./docroot
# # echo "===================================================================================="

# # echo "================================test-case-5========================================="
# # echo "Create a file containing just this data:    

# # example_with_spaces.txt


# # And make it available on your web server at this URL:    

# # http://example.com/.well-known/acme-challenge/example_with_spaces.txt
# # " >>  ./unversioned/test5-expected-dest.txt

# # ./script/modules/letsencrypt-automation/convert-output-to-commands.sh \
# #   ./unversioned/test5-source.txt ./unversioned/test5-actual-dest.txt  \
# #   ./unversioned/test5-actual-test.txt ./docroot


# # echo "===================================================================================="

