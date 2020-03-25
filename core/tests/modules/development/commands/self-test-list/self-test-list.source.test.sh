ERROR=0
BASE=$(pwd)

GlobalSCRIPTDIR="$BASE"/core/tests/modules/development/commands/self-test/self-test.source.test

function output() {
  echo "$1" "$2" "$3"
}

function development_get_all_tests() {
  ALLTESTS=$(find "$GlobalSCRIPTDIR" -name '*test.sh')

  echo "$ALLTESTS"
}

HAYSTACK=$(source "$BASE"/core/modules/development/commands/self-test-list/self-test-list.source.sh)
MESSAGE='All tests appear in list'
NEEDLE='test1-passing-test.sh'
source ./core/modules/testing/scripts/assert.source.sh
NEEDLE='test2-passing-test.sh'
source ./core/modules/testing/scripts/assert.source.sh
NEEDLE='test3-failing-test.sh'
source ./core/modules/testing/scripts/assert.source.sh

source ./core/modules/testing/scripts/cleanup.source.sh
