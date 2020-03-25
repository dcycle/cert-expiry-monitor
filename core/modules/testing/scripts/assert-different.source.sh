if [ "$HAYSTACK" == "$NEEDLE" ]; then
  echo "[fail] both variables are identical: $NEEDLE == $HAYSTACK. $MESSAGE";
  ERROR=1;
else
  echo "[pass] $MESSAGE";
fi
