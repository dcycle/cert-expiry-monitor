ERROR=0
BASE=$(pwd)

HAYSTACK=$("$BASE"/core/modules/structure/scripts/main.sh)
RESULT=$?
NEEDLE="Please do not call the ./main.sh script directly; call the script in the root directly instead."
MESSAGE="./main.sh will complain if called directly."
source ./core/modules/testing/scripts/assert.source.sh
HAYSTACK=$RESULT
NEEDLE=1
MESSAGE="main.sh will exit with 1 if called directly."
source ./core/modules/testing/scripts/assert-identical.source.sh

HAYSTACK=$("$BASE"/core/modules/structure/scripts/main.sh whatever whatever)
RESULT=$?
NEEDLE="Please do not call the ./main.sh script directly; call the script in the root directly instead."
MESSAGE="./main.sh will complain if the first argument is not the path of root."
source ./core/modules/testing/scripts/assert.source.sh
HAYSTACK=$RESULT
NEEDLE=1
MESSAGE="main.sh will exit with 1 if called directly."
source ./core/modules/testing/scripts/assert-identical.source.sh

HAYSTACK=$("$BASE"/core/modules/structure/scripts/main.sh \
  "$BASE" \
  --internalrealscriptdir="$BASE" \
  --internalscriptdir="$BASE" \
  --internalcalldir="$BASE" \
  --internalrunid="normally this is a UUID")
RESULT=$?
HAYSTACK="$RESULT"
NEEDLE=0
MESSAGE="main.sh will exit with 0 if called properly with no command."
source ./core/modules/testing/scripts/assert-identical.source.sh

NEEDLE="0"
HAYSTACK="$RESULT"
MESSAGE="calling ./dcyclebox alone does not result in failure"
source ./core/modules/testing/scripts/assert-identical.source.sh

source ./core/modules/testing/scripts/cleanup.source.sh
