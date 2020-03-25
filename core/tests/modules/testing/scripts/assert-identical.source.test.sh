ERROR=0
BASE=$(pwd)

HAYSTACK='whatever'
NEEDLE='something else'
MESSAGE='assert identical succeeds when expected'
source "$BASE"/core/modules/testing/scripts/assert-identical.source.sh
HAYSTACK="$ERROR"
NEEDLE=0
source ./core/modules/testing/scripts/assert-identical.source.sh
ERROR=0

HAYSTACK='same'
NEEDLE='same'
MESSAGE='assert identical fails expected'
source "$BASE"/core/modules/testing/scripts/assert-identical.source.sh
HAYSTACK="$ERROR"
NEEDLE=1
source ./core/modules/testing/scripts/assert-identical.source.sh
ERROR=0

source ./core/modules/testing/scripts/cleanup.source.sh
