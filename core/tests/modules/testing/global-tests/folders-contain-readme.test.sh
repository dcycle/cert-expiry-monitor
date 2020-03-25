ERROR=0
BASE=$(pwd)

# not sure how to do this without a for loop
# shellcheck disable=SC2044
for i in $(find ./core/modules -maxdepth 1 -type d)
do
  NEEDLE="$i"/README.md
  MESSAGE="$i/README.md must exist -- all directories need to have a README file."
  source ./core/modules/testing/scripts/assert-file.source.sh
done

# shellcheck disable=SC2044
for i in $(find ./script/modules -maxdepth 1 -type d)
do
  NEEDLE="$i"/README.md
  MESSAGE="$i/README.md must exist -- all directories need to have a README file."
  source ./script/modules/testing/scripts/assert-file.source.sh
done

NEEDLE="$BASE"/README.md
MESSAGE="$BASE/README.md must exist -- there needs to be a README file in the base directory."
source ./core/modules/testing/scripts/assert-file.source.sh

source ./core/modules/testing/scripts/cleanup.source.sh
