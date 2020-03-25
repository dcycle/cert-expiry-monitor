ERROR=0
BASE=$(pwd)

source "$BASE"/core/modules/temporary/hooks/init/init.source.sh

HAYSTACK=$(set)
NEEDLE='tmp ()'
MESSAGE="tmp function is defined as expected."
source ./core/modules/testing/scripts/assert.source.sh

source ./core/modules/testing/scripts/cleanup.source.sh
