#!/bin/bash

# Available arguments
#  * $PARAMS, an array of params like 'a=b', 'c=d'
# shellcheck disable=SC2154
for i in "${GlobalPARAMS[@]}"
do
  # shellcheck disable=SC2154
  source "$GlobalSCRIPTDIR"/core/modules/args/scripts/parse-param.source.sh "$i"
  if [ "$NAME" == "$1" ]; then
    ARGVALUE="$VALUE"
  fi
done
