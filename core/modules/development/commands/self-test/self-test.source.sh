ALLTESTS=$(development_get_all_tests)

for f in $ALLTESTS; do
#  output about-to-run:$f 'info' "About to run the test $f"
  "$f" 2>/dev/null >/dev/null || { printf 'E'; FAILURE="$f"; break; } && printf '.'
done

if [ "$FAILURE" != "" ]; then
  echo -e ''
  output fail:"$FAILURE" 'error' "The test $FAILURE has failed. Output follows."
  "$FAILURE"
else
  echo -e ''
  output fail:none 'success' "All tests have passed."
fi

set -e

# Figure out where this script resides and its name.
SCRIPTDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd -P)"

echo -e "[info] removing $SCRIPTDIR/tmp/test-data directory"
rm -rf "$GlobalSCRIPTDIR"/tmp/test-*
echo -e '[info] linting'
DOCKER=docker
source "$GlobalSCRIPTDIR"/core/modules/development/scripts/lint.source.sh
