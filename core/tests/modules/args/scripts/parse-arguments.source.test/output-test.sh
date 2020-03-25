LOCATION=$1
GlobalSCRIPTDIR="$(pwd)/core/tests/modules/args/scripts/parse-arguments.source.test"
shift

function debug () {
  :
}

source "$LOCATION"

set
