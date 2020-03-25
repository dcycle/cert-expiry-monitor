set -e

RESULT=$(./cem.sh internal-test /tests/cem/happy)

echo "$RESULT" | grep 'MAIN SCRIPT CALLED' > /dev/null
echo "$RESULT" | grep 'INVOKE CALLED' > /dev/null
echo "$RESULT" | grep '\-\-internalrealscriptdir=' > /dev/null
echo "$RESULT" | grep '\-\-internalscriptdir=' > /dev/null
echo "$RESULT" | grep '\-\-internalcalldir=' > /dev/null
echo "$RESULT" | grep '\-\-internalrunid=' > /dev/null

RESULT=$(./cem.sh internal-test /tests/cem/sad) || FAIL=1

# even in the case of a failure we clean up before quitting.
echo "$RESULT" | grep 'INVOKE CALLED' > /dev/null
echo $FAIL | grep 1 > /dev/null
