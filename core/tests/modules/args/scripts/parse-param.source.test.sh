ERROR=0
BASE=$(pwd)

source ./core/modules/args/scripts/parse-param.source.sh --name=contains a space
HAYSTACK="$VALUE"
NEEDLE='contains'
MESSAGE="value is contains as expected."
source ./core/modules/testing/scripts/assert-identical.source.sh

source ./core/modules/args/scripts/parse-param.source.sh --"contains a space"=contains a space
HAYSTACK="$VALUE"
NEEDLE='contains'
MESSAGE="value is contains as expected."
source ./core/modules/testing/scripts/assert-identical.source.sh

source ./core/modules/args/scripts/parse-param.source.sh --name=value
HAYSTACK="$VALUE"
NEEDLE='value'
MESSAGE="value is value as expected."
source ./core/modules/testing/scripts/assert-identical.source.sh

source ./core/modules/args/scripts/parse-param.source.sh --"contains a space=contains a space"
HAYSTACK="$VALUE"
NEEDLE='contains a space'
MESSAGE="value is contains a space as expected."
source ./core/modules/testing/scripts/assert-identical.source.sh

source ./core/modules/testing/scripts/cleanup.source.sh
