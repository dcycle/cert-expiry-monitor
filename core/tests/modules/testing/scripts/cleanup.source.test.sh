ERROR=0
BASE=$(pwd)

MESSAGE='cleanup exits with the proper code'
HAYSTACK='ok'

source "$BASE"/core/modules/testing/scripts/cleanup.source.sh || HAYSTACK='BAD'
NEEDLE='ok'
source ./core/modules/testing/scripts/assert-identical.source.sh
HAYSTACK='ok'
ERROR=1
source "$BASE"/core/modules/testing/scripts/cleanup.source.sh || HAYSTACK='BAD'
NEEDLE='BAD'
source ./core/modules/testing/scripts/assert-identical.source.sh
ERROR=0

source ./core/modules/testing/scripts/cleanup.source.sh

