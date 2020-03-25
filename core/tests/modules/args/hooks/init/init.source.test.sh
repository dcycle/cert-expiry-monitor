ERROR=0
BASE=$(pwd)

GlobalSCRIPTDIR="$BASE"/core/tests/modules/args/hooks/init/init.source.test
source "$BASE"/core/modules/args/hooks/init/init.source.sh

HAYSTACK=$(set)
NEEDLE="argvalue ()"
MESSAGE="argvalue function is defined as expected."
source ./core/modules/testing/scripts/assert.source.sh

HAYSTACK=$(argvalue this-is-a-test)
NEEDLE="this-is-a-test"
MESSAGE="correct script is called."
source ./core/modules/testing/scripts/assert.source.sh

source ./core/modules/testing/scripts/cleanup.source.sh
