#!/bin/bash

ERROR=0
BASE=$(pwd)

source "$BASE"/core/modules/output/hooks/init/init.source.sh

HAYSTACK=$(set)
NEEDLE='output ()'
MESSAGE="output function is defined as expected."
source ./core/modules/testing/scripts/assert.source.sh

source ./core/modules/testing/scripts/cleanup.source.sh
