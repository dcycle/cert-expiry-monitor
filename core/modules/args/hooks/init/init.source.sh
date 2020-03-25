# Gets the value of a script parameter, where --parameter=value.
#
# 1 will be returned if --parameter was passed without a value;
# 0 will be returned if --parameter was not passed.
# "this is a value" will be returned if --parameter="this is a value"
#
# @param $1
#   The name of parameter.
function argvalue() {
  source "$GlobalSCRIPTDIR"/core/modules/args/scripts/arg-value.source.sh "$1"
  if [ -z "$ARGVALUE" ]; then
    echo 0
  else
    echo "$ARGVALUE"
  fi
}
