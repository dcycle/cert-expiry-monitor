function debug() {
  source "$GlobalSCRIPTDIR"/core/modules/development/scripts/debug.source.sh "$1"
}

function development_get_all_tests() {
  ALLTESTS=$(find "$GlobalSCRIPTDIR"/core/tests "$GlobalSCRIPTDIR"/script/tests "$GlobalSCRIPTDIR"/tests -name '*.test.sh')

  echo "$ALLTESTS"
}
