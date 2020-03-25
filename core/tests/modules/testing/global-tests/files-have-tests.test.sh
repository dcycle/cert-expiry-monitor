ERROR=0
BASE=$(pwd)

# not sure how to do this without a for loop
# shellcheck disable=SC2044
for i in $(find "$BASE"/core/modules -name '*.sh')
do
  original_string="$i"
  replace_what='/core/modules'
  string_to_replace_with='/core/tests/modules'
  result_string="${original_string/$replace_what/$string_to_replace_with}"
  original_string="$result_string"
  replace_what='.sh'
  string_to_replace_with='.test.sh'
  NEEDLE="${original_string/$replace_what/$string_to_replace_with}"
  # During development you can make the files here by uncommenting:
  # mkdir -p "$(dirname "$NEEDLE")" & touch "$NEEDLE"
  MESSAGE="$NEEDLE is a test for $i -- all files need to have a corresponding test."
  source ./core/modules/testing/scripts/assert-file.source.sh
done

source ./core/modules/testing/scripts/cleanup.source.sh
