ERROR=0
BASE=$(pwd)

source "$BASE"/core/modules/core/hooks/init/init.source.sh

HAYSTACK=$(set)
NEEDLE='uuid ()'
MESSAGE="uuid function is defined as expected."
source ./core/modules/testing/scripts/assert.source.sh

source ./core/modules/testing/scripts/cleanup.source.sh
