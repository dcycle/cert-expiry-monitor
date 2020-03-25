ERROR=0
BASE=$(pwd)

source "$BASE"/core/modules/extensibility/hooks/init/init.source.sh

HAYSTACK=$(set)
NEEDLE='invoke-all ()'
MESSAGE="invoke-all function is defined as expected."
source ./core/modules/testing/scripts/assert.source.sh

source ./core/modules/testing/scripts/cleanup.source.sh
