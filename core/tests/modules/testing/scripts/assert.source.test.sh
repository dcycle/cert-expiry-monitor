ERROR=0
BASE=$(pwd)

HAYSTACK='this contains some string'
NEEDLE='this is not there'
MESSAGE='assert fails when expected'
source "$BASE"/core/modules/testing/scripts/assert.source.sh
HAYSTACK="$ERROR"
NEEDLE=1
source ./core/modules/testing/scripts/assert-identical.source.sh
ERROR=0

HAYSTACK='this contains some string'
NEEDLE='contains'
MESSAGE='assert succeeds when expected'
source "$BASE"/core/modules/testing/scripts/assert.source.sh
HAYSTACK="$ERROR"
NEEDLE=0
source ./core/modules/testing/scripts/assert-identical.source.sh

source ./core/modules/testing/scripts/cleanup.source.sh
