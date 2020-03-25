# Let modules respond to specific events like init, end, etc.
if ls "$GlobalSCRIPTDIR"/core/modules/*/hooks/"$1"/"$1".source.sh 1> /dev/null 2>&1; then
  for f in "$GlobalSCRIPTDIR"/core/modules/*/hooks/"$1"/"$1".source.sh
    do
      # Cannot call debug() here because invoke-all might be used before
      # functions are available.
      source "$GlobalSCRIPTDIR"/core/modules/development/scripts/debug.source.sh "About to call '$f'." 'full'
      source "$f"
  done
else
  source "$GlobalSCRIPTDIR"/core/modules/development/scripts/debug.source.sh "The hook '$1' is not implemented by any core module." 'internal notice'
fi

if ls "$GlobalSCRIPTDIR"/script/modules/*/hooks/"$1"/"$1".source.sh 1> /dev/null 2>&1; then
  for f in "$GlobalSCRIPTDIR"/script/modules/*/hooks/"$1"/"$1".source.sh
    do
      # Cannot call debug() here because invoke-all might be used before
      # functions are available.
      source "$GlobalSCRIPTDIR"/core/modules/development/scripts/debug.source.sh "About to call '$f'." 'full'
      source "$f"
  done
else
  source "$GlobalSCRIPTDIR"/core/modules/development/scripts/debug.source.sh "The hook '$1' is not implemented by any script module." 'internal notice'
fi
