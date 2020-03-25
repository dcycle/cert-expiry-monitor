ERROR=0
BASE=$(pwd)

HAYSTACK=$(./core/tests/modules/args/scripts/parse-arguments.source.test/output-test.sh "$BASE"/core/modules/args/scripts/parse-arguments.source.sh --output-test=nospace --output-test="contains a space" "--output-test=fully-enclosed" --output-test="partially enclosed" -output-test=onedash output-test-no-dash)

NEEDLE="COMMAND=-output-test=onedash"
MESSAGE="$BASE/README.md must exist -- there needs to be a README file in the base directory."
source ./core/modules/testing/scripts/assert.source.sh

source ./core/modules/testing/scripts/cleanup.source.sh

PARAMS=([0]="--output-test=contains" [1]="a" [2]="space" [3]="--output-test=fully-enclosed" [4]="--output-test=partially" [5]="enclosed")

COMMAND=-output-test=onedash

ARGS=([0]="output-test-no-dash")
