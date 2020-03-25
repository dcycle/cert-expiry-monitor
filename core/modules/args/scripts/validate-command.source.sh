ls "$GlobalSCRIPTDIR"/core/modules/*/commands/"$UNVALIDATEDCOMMAND"/"$UNVALIDATEDCOMMAND".source.sh 2>/dev/null >/dev/null || ls "$GlobalSCRIPTDIR"/script/modules/*/commands/"$UNVALIDATEDCOMMAND"/"$UNVALIDATEDCOMMAND".source.sh 2>/dev/null >/dev/null || { echo -e "$GlobalSCRIPTNAME: Invalid command $UNVALIDATEDCOMMAND"; echo -e "See '$GlobalSCRIPTNAME usage' for available commands."; exit 1; }

GlobalCOMMAND="$UNVALIDATEDCOMMAND"
