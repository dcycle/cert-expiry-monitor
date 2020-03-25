ERROR=0
BASE=$(pwd)

LOG=(a b c)
source "$BASE"/core/modules/development/scripts/debug.source.sh HELLO WORLD
HAYSTACK=$(printf '%s - ' "${LOG[@]}")
NEEDLE="a - b - c - \[WORLD\] HELLO"
MESSAGE='debug log entry added'
source ./core/modules/testing/scripts/assert.source.sh

source ./core/modules/testing/scripts/cleanup.source.sh
