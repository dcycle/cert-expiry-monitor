#!/bin/bash

ERROR=0
BASE=$(pwd)

MESSAGE='cleanup exits with the proper code'
HAYSTACK='ok'
# shellcheck disable=SC2317
source "$BASE"/core/modules/testing/scripts/cleanup.source.sh || HAYSTACK='BAD'
# shellcheck disable=SC2317
NEEDLE='ok'
# shellcheck disable=SC2317
source ./core/modules/testing/scripts/assert-identical.source.sh
# shellcheck disable=SC2317
HAYSTACK='ok'
# shellcheck disable=SC2317
ERROR=1
# shellcheck disable=SC2317
source "$BASE"/core/modules/testing/scripts/cleanup.source.sh || HAYSTACK='BAD'
# shellcheck disable=SC2317
NEEDLE='BAD'
# shellcheck disable=SC2317
source ./core/modules/testing/scripts/assert-identical.source.sh
# shellcheck disable=SC2317
ERROR=0
# shellcheck disable=SC2317
source ./core/modules/testing/scripts/cleanup.source.sh

