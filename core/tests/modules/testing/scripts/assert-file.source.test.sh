ERROR=0
BASE=$(pwd)

NEEDLE='this/surely/does/not.exist'
MESSAGE='assert file fails when expected'
source "$BASE"/core/modules/testing/scripts/assert-file.source.sh
HAYSTACK="$ERROR"
NEEDLE=1
source ./core/modules/testing/scripts/assert-identical.source.sh
ERROR=0

NEEDLE="$BASE"/README.md
MESSAGE='assert file succeeds when expected'
source "$BASE"/core/modules/testing/scripts/assert-file.source.sh
HAYSTACK="$ERROR"
NEEDLE=0
source ./core/modules/testing/scripts/assert-identical.source.sh

source ./core/modules/testing/scripts/cleanup.source.sh
