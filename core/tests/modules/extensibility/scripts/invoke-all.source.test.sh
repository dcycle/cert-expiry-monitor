ERROR=0
BASE=$(pwd)

GlobalSCRIPTDIR="$BASE"/core/tests/modules/extensibility/scripts/invoke-all.source.test
HAYSTACK=$(source "$BASE"/core/modules/extensibility/scripts/invoke-all.source.sh nothing)
MESSAGE="no implementation ok"
NEEDLE="is not implemented by any core module"
source ./core/modules/testing/scripts/assert.source.sh
NEEDLE="is not implemented by any script module"
source ./core/modules/testing/scripts/assert.source.sh

HAYSTACK=$(source "$BASE"/core/modules/extensibility/scripts/invoke-all.source.sh some-hook)

MESSAGE="Correct implementations called"
NEEDLE="Core hook called"
source ./core/modules/testing/scripts/assert.source.sh
NEEDLE="Script hook called"
source ./core/modules/testing/scripts/assert.source.sh
NEEDLE="Random hook called"
source ./core/modules/testing/scripts/assert-not.source.sh

source "$BASE"/core/modules/testing/scripts/cleanup.source.sh
