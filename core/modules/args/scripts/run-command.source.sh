#!/bin/bash

# At this point $GlobalCOMMAND is valid so we can run it.
# shellcheck disable=SC2154
invoke-all "pre-command-$GlobalCOMMAND"
# shellcheck disable=SC2154
if [ "$(ls "$GlobalSCRIPTDIR"/core/modules/*/commands/"$GlobalCOMMAND"/"$GlobalCOMMAND".source.sh 2>/dev/null)" ]; then
  for f in "$GlobalSCRIPTDIR"/core/modules/*/commands/"$GlobalCOMMAND"/"$GlobalCOMMAND".source.sh
    do
      # shellcheck disable=SC1090
      source "$f"
  done
fi

if [ "$(ls "$GlobalSCRIPTDIR"/script/modules/*/commands/"$GlobalCOMMAND"/"$GlobalCOMMAND".source.sh 2>/dev/null)" ]; then
  for f in "$GlobalSCRIPTDIR"/script/modules/*/commands/"$GlobalCOMMAND"/"$GlobalCOMMAND".source.sh
    do
      # shellcheck disable=SC1090
      source "$f"
  done
fi

invoke-all "post-command-$GlobalCOMMAND"
