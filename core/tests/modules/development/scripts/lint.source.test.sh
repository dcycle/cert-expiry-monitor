ERROR=0
BASE=$(pwd)

DOCKER='echo docker'
GlobalSCRIPTDIR="$BASE"

HAYSTACK=$(source "$BASE"/core/modules/development/scripts/lint.source.sh)

echo "AAA"
echo "$HAYSTACK"
echo "ZZZ"

NEEDLE="./core/tests/modules/temporary/hooks/cleanup/cleanup.source.test.sh"
MESSAGE="Linting source finds ALL files including the randomly-selected $NEEDLE"
source ./core/modules/testing/scripts/assert.source.sh

source ./core/modules/testing/scripts/cleanup.source.sh
