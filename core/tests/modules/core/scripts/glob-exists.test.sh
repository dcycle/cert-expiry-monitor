ERROR=0
BASE=$(pwd)

MESSAGE='glob-exists.sh works whether there are 0, 1 or >1 matches'
HAYSTACK=$(source "$BASE"/core/modules/core/scripts/glob-exists.sh "this/does/not/exist")
NEEDLE='false'
source ./core/modules/testing/scripts/assert-identical.source.sh

HAYSTACK=$(source "$BASE"/core/modules/core/scripts/glob-exists.sh "$BASE"/core/*/core/*/glob-exists.sh)
NEEDLE='true'
source ./core/modules/testing/scripts/assert-identical.source.sh

HAYSTACK=$(source "$BASE"/core/modules/core/scripts/glob-exists.sh "$BASE"/core/*/*/README.md)
NEEDLE='true'
source ./core/modules/testing/scripts/assert-identical.source.sh

source ./core/modules/testing/scripts/cleanup.source.sh
