DAYS=$(argvalue days)
SITES=$(argvalue sites)

if [ -z $DAYS ];then
  DAYS=200
fi

echo "$SITES"

IFS=';' read -ra SITESARR <<< "$SITES"
for SITE in "${SITESARR[@]}"; do
  if [ "$SITE" == "0" ];then
    echo 'You seem to have no sites, or one of your sites is "0" which is invalid'
    echo 'Consider using --sites="example.com" or --sites="example.com;example2.com"'
  fi
  source ./script/modules/check/commands/check/check-single.source.sh
done

if [ -z "$ERR" ]; then
  echo " => "
  echo " => All sites expire in under $DAYS days."
  echo " =>"
else
  >&2 echo " => "
  >&2 echo " => Some sites expire in less than $DAYS days:"
  IFS=';' read -ra ERRARR <<< "$ERR"
  for SITEERR in "${ERRARR[@]}"; do
    echo "   => $SITEERR"
  done
  >&2 echo " => "
  exit 1
fi
