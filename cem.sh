#!/bin/bash
# See README.md for more details on this script and what it does.
# This file is the entry point to ./core/modules/structure/scripts/main.sh; this file
# provides ./core/modules/structure/scripts/main.sh with a unique execution id, and
# allows modules to perform cleanup regardless of whether
# ./core/modules/structure/scripts/main.sh passed or failed.

# we are purposefully not propagating errors, to allow for cleanup.

# The full location of this script. This path can contain aliases because -P is
# not used with pwd.
GlobalREALSCRIPTDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd)"
GlobalSCRIPTNAME=$(basename "$0")

# During testing, you can call this script with special the first two arguments
# being "internal-test" and "/mock/path", which will tell us to not actually
# call all scripts directly, but to call them within the mock path. This is used
# for unit testing and development; see ./core/modules/testing/* for an example of
# how to use this.
if [[ "$1" == 'internal-test' ]]; then
  MOCKLOCATION=$2
fi
GlobalSCRIPTDIR="$GlobalREALSCRIPTDIR""$MOCKLOCATION"

# The full location from where this script was called, with no trailing slash.
# This path can contain aliases because -P is not used with pwd.
# To use this global, you should "enclose it in quotes" because the
# path might include spaces.
GlobalCALLDIR="$(pwd)"

# A unique id for each execution. This can be used to store temporary
# files or build uniquely-named docker containers.
if [ -f /proc/sys/kernel/random/uuid ]; then
  GlobalRUNID=$(cat /proc/sys/kernel/random/uuid)
else
  # Mac OS X does not have the uuid utility, use random numbers instead,
  # even though this script does not officially support Mac OS X.
  GlobalRUNID="$RANDOM$RANDOM$RANDOM"
fi

# Call the core/modules/structure/scripts/main script, or the mock equivalent, passing it what we know so
# far about the call, in addition to any parameters passed by the user.
"$GlobalSCRIPTDIR"/core/modules/structure/scripts/main.sh \
  "$GlobalSCRIPTDIR" \
  "$GlobalSCRIPTNAME" \
  --internalrealscriptdir="$GlobalREALSCRIPTDIR" \
  --internalscriptdir="$GlobalSCRIPTDIR" \
  --internalcalldir="$GlobalCALLDIR" \
  --internalrunid="$GlobalRUNID" \
  "$@"
GlobalEXITCODE=$?

# Provide all modules with the possibility to clean up after themselves,
# regardless of whether ./core/modules/structure/scripts/main.sh passed or failed.
source "$GlobalSCRIPTDIR"/core/modules/extensibility/scripts/invoke-all.source.sh 'cleanup'

# Now we can exit with the code provided by ./core/modules/structure/scripts/main.sh
exit $GlobalEXITCODE
