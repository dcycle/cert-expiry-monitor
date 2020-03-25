if [ "$HAYSTACK" == "$NEEDLE" ]; then
  echo "[pass] $MESSAGE";
else
  echo "[fail] both variables are not identical: $NEEDLE != $HAYSTACK. $MESSAGE";
  ERROR=1;
fi
