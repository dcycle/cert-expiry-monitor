#!/bin/bash
# See README.md for more details on this script and what it does.

# This file is called by the main script, which will pass it the following
# arguments in the following order.
#  * $1: The script directory, which contains the main entry point or a mock
#        equivalent.
#  * $2: The name of the script called by the user.
#  * $3: --internalrealscriptdir="/path/to/script/directory/", where
#          the script really resides. Should rarely be used by modules.
#  * $4: --internalscriptdir="/path/to/script/mock/directory/", where all
#          required sourced scripts reside. During normal execution, this will
#          bethe same as --internalrealscriptdir; during testing it will be
#          a path to mock scripts.
#  * $5: --internalcalldir="/path/to/where/dcycle/was/called/from"
#  * $6: --internalrunid="<a unique ID for this execution>"
#  * $7 and more: additional commands or arguments passed by the user.

# propagate errors
set -e

# Before doing anything else, make sure the first argument is the
# location of our parent (or mock equivalent) -- if the location of the
# invoke-all script is OK, that means the first argument is valid.
if [[ -f "$1"/core/modules/extensibility/scripts/invoke-all.source.sh ]]; then
  # The script directory is the first parameter
  GlobalSCRIPTDIR="$1"
  shift
else
  # The main script takes care of calling ./main.sh with the correct path
  # as a first parameter. Chances are someone tried to call ./main.sh
  # directly.
  echo -e "Please do not call the ./main.sh script directly; call the script in the root directly instead."
  exit 1;
fi

# shell check thinks this is not used, but it is used in sourced items.
# shellcheck disable=SC2034
GlobalSCRIPTNAME="$1"
shift

# Print the header.
source "$GlobalSCRIPTDIR"/core/modules/extensibility/scripts/invoke-all.source.sh 'header'

# Preflight.
source "$GlobalSCRIPTDIR"/core/modules/extensibility/scripts/invoke-all.source.sh 'preflight'

# start by performing low-level initialization which does not require
# arguments. This will allow modules to define functions.
source "$GlobalSCRIPTDIR"/core/modules/extensibility/scripts/invoke-all.source.sh 'init'

# now we can parse our arguments, flags and commands
source "$GlobalSCRIPTDIR"/core/modules/args/scripts/parse-arguments.source.sh

# the above will have set $GlobalCOMMAND, and validate it. If the command is
# not valid, an error message will appear on screen, and we will exit with 1.
# If $GlobalCOMMAND is empty, we will use "usage" by default.
if [ -z "$GlobalCOMMAND" ]; then
  GlobalCOMMAND=usage
fi

source "$GlobalSCRIPTDIR"/core/modules/args/scripts/run-command.source.sh
