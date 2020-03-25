ERROR=0
BASE=$(pwd)

GlobalPARAMS+=(test-one)
GlobalPARAMS+=(test-two)
GlobalPARAMS+=(test-three)

GlobalSCRIPTDIR="$BASE"/core/tests/modules/args/scripts/arg-value.source.test
source "$BASE"/core/modules/args/scripts/arg-value.source.sh "firstname"

echo -e "$ARGVALUE"
HAYSTACK="$ARGVALUE"
NEEDLE="firstvalue"
MESSAGE="Name value pair as expected (firstvalue - firstname)."
source ./core/modules/testing/scripts/assert.source.sh

source "$BASE"/core/modules/args/scripts/arg-value.source.sh "secondname"
HAYSTACK="$ARGVALUE"
NEEDLE="secondvalue"
MESSAGE="Name value pair as expected (secondvalue - secondname)."
source ./core/modules/testing/scripts/assert.source.sh

source "$BASE"/core/modules/args/scripts/arg-value.source.sh "thirdname"
HAYSTACK="$ARGVALUE"
NEEDLE="thirdvalue"
MESSAGE="Name value pair as expected (thirdvalue - thirdname)."
source ./core/modules/testing/scripts/assert.source.sh

source ./core/modules/testing/scripts/cleanup.source.sh
