ERROR=0
BASE=$(pwd)

function invoke-all() {
  printf "RUNNING HOOK %s" "$1"
}
GlobalSCRIPTDIR="$(pwd)"/core/tests/modules/args/scripts/run-command.source.test
GlobalCOMMAND='some-command-name'

invoke-all "pre-command-$GlobalCOMMAND"

HAYSTACK=$(source "$(pwd)"/core/modules/args/scripts/run-command.source.sh)

NEEDLE='RUNNING HOOK pre-command-some-command-name'
MESSAGE='pre hook called'
source ./core/modules/testing/scripts/assert.source.sh

NEEDLE='RUNNING HOOK post-command-some-command-name'
MESSAGE='post hook called'
source ./core/modules/testing/scripts/assert.source.sh

NEEDLE='command called in core'
MESSAGE='core can contain command'
source ./core/modules/testing/scripts/assert.source.sh

NEELDE='command called in script'
MESSAGE='script can contain command'
source ./core/modules/testing/scripts/assert.source.sh

NEEDLE='command called in whatever'
MESSAGE='Only script and core can contain commands'
source ./core/modules/testing/scripts/assert-not.source.sh

source ./core/modules/testing/scripts/cleanup.source.sh
