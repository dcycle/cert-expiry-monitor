ERROR=0
BASE=$(pwd)
GlobalSCRIPTNAME='some-script-name.sh'

HAYSTACK=$(source "$BASE"/core/modules/help/hooks/usage/usage.source.sh)
NEEDLE='call some-script-name.sh with no additional arguments to get help'
MESSAGE='use script name from var'
source ./core/modules/testing/scripts/assert.source.sh

source ./core/modules/testing/scripts/cleanup.source.sh
