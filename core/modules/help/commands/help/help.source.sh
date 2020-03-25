if [ -z "$GlobalARGS" ]; then
  if [ -f "$GlobalSCRIPTDIR"/script/modules/help/help.txt ]; then
    cat "$GlobalSCRIPTDIR"/script/modules/help/help.txt
  else
    cat "$GlobalSCRIPTDIR"/core/modules/help/help.txt
  fi
else
  COMMANDEXISTS='false'
  if [ "$(ls "$GlobalSCRIPTDIR"/core/modules/*/commands/"$GlobalARGS"/"$GlobalARGS".source.sh 2>/dev/null)" ]; then
    for f in "$GlobalSCRIPTDIR"/core/modules/*/commands/"$GlobalARGS"/"$GlobalARGS".source.sh
      do
        original_string="$f"
        replace_what=/"$GlobalARGS".source.sh
        string_to_replace_with=''
        COMMANDEXISTS="${original_string/$replace_what/$string_to_replace_with}"
    done
  fi

  if [ "$(ls "$GlobalSCRIPTDIR"/script/modules/*/commands/"$GlobalARGS"/"$GlobalARGS".source.sh 2>/dev/null)" ]; then
    for f in "$GlobalSCRIPTDIR"/script/modules/*/commands/"$GlobalARGS"/"$GlobalARGS".source.sh
      do
        original_string="$f"
        replace_what=/"$GlobalARGS".source.sh
        string_to_replace_with=''
        COMMANDEXISTS="${original_string/$replace_what/$string_to_replace_with}"
    done
  fi

  if [ "$COMMANDEXISTS" == 'false' ]; then
    echo -e "$GlobalSCRIPTNAME: Invalid command $GlobalARGS"
    echo -e "See '$GlobalSCRIPTNAME usage' for available commands."
    exit 1
  else
    cat "$COMMANDEXISTS"/README.md
    echo ""
    echo "Available arguments (if any)"
    echo "-----"
    echo ""
    ls "$COMMANDEXISTS"/arguments/*/README.md 2>/dev/null >/dev/null && cat "$COMMANDEXISTS"/arguments/*/README.md || echo '(no available arguments)'
  fi
fi

