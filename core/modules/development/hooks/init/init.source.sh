#!/bin/bash

function debug() {
  # shellcheck disable=SC2154
  source "$GlobalSCRIPTDIR"/core/modules/development/scripts/debug.source.sh "$1"
}

function development_get_all_tests() {
  ALLTESTS=$(find "$GlobalSCRIPTDIR"/core/tests "$GlobalSCRIPTDIR"/script/tests "$GlobalSCRIPTDIR"/tests -name '*.test.sh')

  echo "$ALLTESTS"
}
