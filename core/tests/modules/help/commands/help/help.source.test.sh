ERROR=0
BASE=$(pwd)

GlobalSCRIPTNAME='some-script-name.sh'
GlobalARGS=
GlobalSCRIPTDIR="$BASE"/core/tests/modules/help/commands/help/help.source.test/only-core-help
HAYSTACK=$(source "$BASE"/core/modules/help/commands/help/help.source.sh)
NEEDLE='CORE HELP'
MESSAGE='show core help if script help not available'
source "$BASE"/core/modules/testing/scripts/assert.source.sh

GlobalSCRIPTDIR="$BASE"/core/tests/modules/help/commands/help/help.source.test/core-and-script-help
HAYSTACK=$(source "$BASE"/core/modules/help/commands/help/help.source.sh)
NEEDLE='SCRIPT HELP'
MESSAGE='show script help if available'
source "$BASE"/core/modules/testing/scripts/assert.source.sh

GlobalARGS=some-command
HAYSTACK=$(source "$BASE"/core/modules/help/commands/help/help.source.sh) || EXITTEST='exits with 1 if command not found'

MESSAGE='Proper behaviour if command not available.'
NEEDLE='some-script-name.sh: Invalid command some-command'
source "$BASE"/core/modules/testing/scripts/assert.source.sh
NEEDLE="See 'some-script-name.sh usage' for available commands"
source "$BASE"/core/modules/testing/scripts/assert.source.sh

MESSAGE='exits with 1 if command not found.'
HAYSTACK="$EXITTEST"
NEEDLE='exits with 1 if command not found'
source ./core/modules/testing/scripts/assert-identical.source.sh

GlobalSCRIPTDIR="$BASE"/core/tests/modules/help/commands/help/help.source.test/some-command
HAYSTACK=$(source "$BASE"/core/modules/help/commands/help/help.source.sh)
MESSAGE='If same command exists in core and script, the script description shown'
NEEDLE='DESCRIPTION OF SCRIPT-SOMECOMMAND'
source "$BASE"/core/modules/testing/scripts/assert.source.sh
NEEDLE='DESCRIPTION OF CORE-SOMECOMMAND'
source "$BASE"/core/modules/testing/scripts/assert-not.source.sh

source ./core/modules/testing/scripts/cleanup.source.sh
