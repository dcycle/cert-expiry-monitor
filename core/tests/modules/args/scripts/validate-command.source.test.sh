ERROR=0
BASE=$(pwd)

GlobalSCRIPTDIR="$BASE"/core/tests/modules/args/scripts/validate-command.source.test

HAYSTACK=0
UNVALIDATEDCOMMAND='command-only-in-whatever'
HAYSTACK=$(source "$BASE"/core/modules/args/scripts/validate-command.source.sh) || HAYSTACK=1
NEEDLE=1
MESSAGE='Command which exists in directory other than core or script results in error'
source "$BASE"/core/modules/testing/scripts/assert-identical.source.sh

HAYSTACK=0
UNVALIDATEDCOMMAND='command-only-in-core'
HAYSTACK=$(source "$BASE"/core/modules/args/scripts/validate-command.source.sh) || HAYSTACK=1
NEEDLE=
MESSAGE='Command which exists in core validates'
source "$BASE"/core/modules/testing/scripts/assert-identical.source.sh

HAYSTACK=0
UNVALIDATEDCOMMAND='command-only-in-script'
HAYSTACK=$(source "$BASE"/core/modules/args/scripts/validate-command.source.sh) || HAYSTACK=1
NEEDLE=
MESSAGE='Command which exists in script validates'
source "$BASE"/core/modules/testing/scripts/assert-identical.source.sh

HAYSTACK=0
UNVALIDATEDCOMMAND='command-in-both-core-and-script'
HAYSTACK=$(source "$BASE"/core/modules/args/scripts/validate-command.source.sh) || HAYSTACK=1
NEEDLE=
MESSAGE='Command which exists in core and script validates'
source "$BASE"/core/modules/testing/scripts/assert-identical.source.sh

source ./core/modules/testing/scripts/cleanup.source.sh
