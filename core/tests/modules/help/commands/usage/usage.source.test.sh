ERROR=0
BASE=$(pwd)
GlobalSCRIPTNAME='some-script-name.sh'
GlobalSCRIPTDIR="$BASE"/core/tests/modules/help/commands/usage/usage.source.test

HAYSTACK=$(source "$BASE"/core/modules/help/commands/usage/usage.source.sh)

MESSAGE='correct arguments and commands appear'
NEEDLE='CORE ARGUMENT'
source "$BASE"/core/modules/testing/scripts/assert.source.sh
NEEDLE='RANDOM ARGUMENT'
source "$BASE"/core/modules/testing/scripts/assert-not.source.sh
NEEDLE='SCRIPT ARGUMENT'
source "$BASE"/core/modules/testing/scripts/assert.source.sh
NEEDLE='CORE COMMAND'
source "$BASE"/core/modules/testing/scripts/assert.source.sh
NEEDLE='RANDOM COMMAND'
source "$BASE"/core/modules/testing/scripts/assert-not.source.sh
NEEDLE='SCRIPT COMMAND'
source "$BASE"/core/modules/testing/scripts/assert.source.sh

GlobalSCRIPTDIR="$BASE"/core/tests/modules/help/commands/usage/usage.source.test/does/not/exist
HAYSTACK=$(source "$BASE"/core/modules/help/commands/usage/usage.source.sh 2>&1)
NEEDLE='cannot open'
MESSAGE='Do not fail if documentation not found'
source "$BASE"/core/modules/testing/scripts/assert-not.source.sh

source ./core/modules/testing/scripts/cleanup.source.sh
