ERROR=0
BASE=$(pwd)

NEEDLE=$(source "$BASE"/core/modules/core/scripts/uuid.sh)
HAYSTACK=$(source "$BASE"/core/modules/core/scripts/uuid.sh)
MESSAGE='two uuids are different'
source ./core/modules/testing/scripts/assert-not.source.sh

source ./core/modules/testing/scripts/cleanup.source.sh
