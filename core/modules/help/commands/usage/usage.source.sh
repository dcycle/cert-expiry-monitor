echo -e ""
echo -e "Usage (call $GlobalSCRIPTNAME with no additional arguments to get help):"
echo -e "-----"
echo -e ""
echo -e "$GlobalSCRIPTNAME [command] [arguments] [parameters]"
echo -e ""
echo -e "Available global arguments:"
echo -e "-----"
echo -e ""
if [ "$("$GlobalSCRIPTDIR"/core/modules/core/scripts/glob-exists.sh "$GlobalSCRIPTDIR"/core/modules/*/arguments/*/README.md)" == 'true' ]; then
  head -n 1 "$GlobalSCRIPTDIR"/core/modules/*/arguments/*/README.md | grep -v == | grep -v '^$'
else
  echo -e "[no core arguments found, this should not happen!]"
fi
if [ "$("$GlobalSCRIPTDIR"/core/modules/core/scripts/glob-exists.sh  "$GlobalSCRIPTDIR"/script/modules/*/arguments/*/README.md)" == 'true' ]; then
  head -n 1 "$GlobalSCRIPTDIR"/script/modules/*/arguments/*/README.md | grep -v == | grep -v '^$'
else
  echo -e "[no script-specific arguments are defined]"
fi

echo -e ""
echo -e "Available commands:"
echo -e "-----"
echo -e ""
if [ "$("$GlobalSCRIPTDIR"/core/modules/core/scripts/glob-exists.sh "$GlobalSCRIPTDIR"/core/modules/*/commands/*/README.md)" == 'true' ]; then
  head -n 1 "$GlobalSCRIPTDIR"/core/modules/*/commands/*/README.md | grep -v == | grep -v '^$'
else
  echo -e "[no core commands found, this should not happen!]"
fi
if [ "$("$GlobalSCRIPTDIR"/core/modules/core/scripts/glob-exists.sh "$GlobalSCRIPTDIR"/script/modules/*/commands/*/README.md)" == 'true' ]; then
  head -n 1 "$GlobalSCRIPTDIR"/script/modules/*/commands/*/README.md | grep -v == | grep -v '^$'
else
  echo -e "[no script-specific commands are defined]"
fi
echo -e ""
