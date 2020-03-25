set -e

# start by cycling through all arguments provided by the user.
while [ $# -gt 0 ]; do
  debug "PARSING $1"
  if [[ $1 == *"--"* ]]; then
    GlobalPARAMS+=("$1")
    debug "$1 is a parameter"
  else
    if [ -z "$UNVALIDATEDCOMMAND" ]; then
      UNVALIDATEDCOMMAND=$1
      debug "Command is $COMMAND"
    else
      GlobalARGS+=($1)
      debug "$1 is an arg"
    fi
  fi
  shift
done

if [ -z "$UNVALIDATEDCOMMAND" ]; then
  UNVALIDATEDCOMMAND=help
fi

source "$GlobalSCRIPTDIR"/core/modules/args/scripts/validate-command.source.sh
