#!/bin/bash
MYERR=""
DATE=$(echo | openssl s_client -servername "$SITE" -connect "$SITE":443 2>/dev/null | openssl x509 -noout -dates | grep notAfter) || MYERR="NOCERT"

if [ "$MYERR" == "NOCERT" ]; then
  ERR=$ERR";$SITE does not seem to have a certificate at all"
else
  curl -I https://"$SITE" >/dev/null 2>/dev/null || MYERR="NOCURL"
  if [ "$MYERR" == "NOCURL" ]; then
    ERR=$ERR";$SITE could not be reached via curl"
  else
    DATE=$(printf '%s\n' "${DATE//notAfter=/}")
    DATETOCONVERT="$DATE"
    source ./script/modules/check/commands/check/convert.source.sh
    EXP=$CONVERTEDDATE
    source ./script/modules/check/commands/check/today.source.sh
    DATETOCONVERT="$TODAY"
    source ./script/modules/check/commands/check/convert.source.sh
    DIFF=$(echo "($EXP-$CONVERTEDDATE)/60/60/24"|bc)
    echo "$SITE expires in $DIFF days, on $DATE"
    if [ "$DIFF" -lt "$DAYS" ]; then
      ERR=$ERR";$SITE expires in $DIFF days"
    fi;
  fi;
fi;
