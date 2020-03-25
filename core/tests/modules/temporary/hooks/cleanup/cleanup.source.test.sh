ERROR=0
BASE=$(pwd)

rm -rf "$BASE"/tmp/cleanup-source-test
mkdir -p "$BASE"/tmp/cleanup-source-test/tmp/some-run-id
touch "$BASE"/tmp/cleanup-source-test/tmp/some-run-id/whatever.txt

HAYSTACK=$(source "$BASE"/core/modules/temporary/hooks/cleanup/cleanup.source.sh || echo 'exited with error')
NEEDLE='the cleanup hook expects GlobalRUNID to be set'
MESSAGE='temporary/hooks/cleanup/cleanup.source.sh expects run id to be set'
source "$BASE"/core/modules/testing/scripts/assert.source.sh
NEEDLE="$BASE"/tmp/cleanup-source-test/tmp/some-run-id/whatever.txt
MESSAGE='file was not deleted'
source "$BASE"/core/modules/testing/scripts/assert-file.source.sh

GlobalRUNID='some-run-id'
HAYSTACK='exited with success'
source "$BASE"/core/modules/temporary/hooks/cleanup/cleanup.source.sh || HAYSTACK='exited with error'
NEEDLE='exited with success'
MESSAGE='temporary/hooks/cleanup/cleanup.source.sh works when run id is set'
source "$BASE"/core/modules/testing/scripts/assert-identical.source.sh

rm -rf "$BASE"/tmp/cleanup-source-test

source ./core/modules/testing/scripts/cleanup.source.sh
