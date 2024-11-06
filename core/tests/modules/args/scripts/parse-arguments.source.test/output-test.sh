#!/bin/bash

LOCATION=$1
GlobalSCRIPTDIR="$(pwd)/core/tests/modules/args/scripts/parse-arguments.source.test"
shift

function debug () {
  :
}
# shellcheck disable=SC1090
source "$LOCATION"

set
