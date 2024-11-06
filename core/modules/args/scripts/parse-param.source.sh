#!/bin/bash

ARG="$1"
NAME="${ARG%%=*}"     # Remove everything after the first '='
NAME="${NAME//--/}"    # Remove '--' from the name
VALUE="${ARG#*=}"      # Extract the value after '='

# If VALUE is empty, set it to 1
if [ -z "$VALUE" ]; then
  VALUE=1
fi

