ERROR=0
BASE=$(pwd)

function argvalue() {
  echo '1';
}

LOG=(hello world)
HAYSTACK=$(source "$BASE"/core/modules/development/hooks/end/end.source.sh)
MESSAGE="Debug log printed when --debug set"
NEEDLE="Printing full log because you set the --debug flag"
source ./core/modules/testing/scripts/assert.source.sh
NEEDLE="hello"
source ./core/modules/testing/scripts/assert.source.sh
NEEDLE="world"
source ./core/modules/testing/scripts/assert.source.sh

function argvalue() {
  echo '0';
}

LOG=(hello world)
HAYSTACK=$(source "$BASE"/core/modules/development/hooks/end/end.source.sh)
MESSAGE="Nothing printed when --debug not set"
NEEDLE=""
source ./core/modules/testing/scripts/assert-identical.source.sh

source ./core/modules/testing/scripts/cleanup.source.sh
