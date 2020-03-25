ERROR=0
BASE=$(pwd)

function output() {
  echo "[$2] $3"
}

GlobalSCRIPTDIR="$BASE/core/tests/modules/development/hooks/init/init.source.test"
source ./core/modules/development/hooks/init/init.source.sh

HAYSTACK=$(set)
NEEDLE='debug ()'
MESSAGE="debug function is defined as expected."
source ./core/modules/testing/scripts/assert.source.sh

HAYSTACK=$(set)
NEEDLE='development_get_all_tests ()'
MESSAGE="development_get_all_tests function is defined as expected."
source ./core/modules/testing/scripts/assert.source.sh

TESTLIST=$(development_get_all_tests)

HAYSTACK="$TESTLIST"
NEEDLE="core.test.sh"
MESSAGE="core.test.sh appears as expected."
source ./core/modules/testing/scripts/assert.source.sh

HAYSTACK="$TESTLIST"
NEEDLE="script.test.sh"
MESSAGE="script.test.sh appears as expected."
source ./core/modules/testing/scripts/assert.source.sh

HAYSTACK="$TESTLIST"
NEEDLE="tests.test.sh"
MESSAGE="tests.test.sh appears as expected."
source ./core/modules/testing/scripts/assert.source.sh

HAYSTACK="$TESTLIST"
NEEDLE="ignore.test.sh"
MESSAGE="ignore.test.sh does not appear, which is expected."
source ./core/modules/testing/scripts/assert-not.source.sh

source ./core/modules/testing/scripts/cleanup.source.sh
