ERROR=0
BASE=$(pwd)
GlobalSCRIPTDIR="$BASE"/core/tests/modules/development/commands/self-test/self-test.source.test

function development_get_all_tests() {
  ALLTESTS=$(find "$GlobalSCRIPTDIR" -name '*test.sh')

  echo "$ALLTESTS"
}

function output() {
  echo "$1" "$2" "$3"
}

HAYSTACK=$(source "$BASE"/core/modules/development/commands/self-test/self-test.source.sh)

NEEDLE='..E'
NEEDLE='has failed. Output follows'
MESSAGE='correct output for failing test'
source ./core/modules/testing/scripts/assert.source.sh

function development_get_all_tests() {
  ALLTESTS=$(find "$GlobalSCRIPTDIR" -name 'passing-test.sh')

  echo "$ALLTESTS"
}

HAYSTACK=$(source "$BASE"/core/modules/development/commands/self-test/self-test.source.sh || true)

NEEDLE='All tests have passed'
NEEDLE='LINTER IS CALLED'
MESSAGE='correct output for passing test'
source ./core/modules/testing/scripts/assert.source.sh

source ./core/modules/testing/scripts/cleanup.source.sh
