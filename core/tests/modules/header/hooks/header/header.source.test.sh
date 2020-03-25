ERROR=0
BASE=$(pwd)
GlobalSCRIPTDIR="$(pwd)"/core/tests/modules/header/hooks/header/header.source.test

HAYSTACK=$(source ./core/modules/header/hooks/header/header.source.sh)
NEEDLE='Core header'
MESSAGE="Core header used if not overridden."
source ./core/modules/testing/scripts/assert-identical.source.sh

GlobalSCRIPTDIR="$(pwd)"/core/tests/modules/header/hooks/header/header.source.test2
HAYSTACK=$(source ./core/modules/header/hooks/header/header.source.sh)
NEEDLE='Overridden header'
MESSAGE="Header can be overridden."
source ./core/modules/testing/scripts/assert-identical.source.sh

source ./core/modules/testing/scripts/cleanup.source.sh
