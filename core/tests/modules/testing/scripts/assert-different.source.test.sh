ERROR=0
BASE=$(pwd)

HAYSTACK='same'
NEEDLE='same'
MESSAGE='assert differents fails when expected'
source "$BASE"/core/modules/testing/scripts/assert-different.source.sh > /dev/null
HAYSTACK="$ERROR"
NEEDLE=1
source ./core/modules/testing/scripts/assert-identical.source.sh
ERROR=0

HAYSTACK='same'
NEEDLE='something else'
MESSAGE='assert differents succeeds when expected'
source "$BASE"/core/modules/testing/scripts/assert-different.source.sh > /dev/null
HAYSTACK="$ERROR"
NEEDLE=0
source ./core/modules/testing/scripts/assert-identical.source.sh

source ./core/modules/testing/scripts/cleanup.source.sh
