# Available arguments
#  * $PARAMS, an array of params like 'a=b', 'c=d'

for i in "${GlobalPARAMS[@]}"
do
  source "$GlobalSCRIPTDIR"/core/modules/args/scripts/parse-param.source.sh "$i"
  if [ "$NAME" == "$1" ]; then
    ARGVALUE="$VALUE"
  fi
done
