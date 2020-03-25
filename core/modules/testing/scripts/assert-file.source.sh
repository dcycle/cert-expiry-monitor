if [ -f "$NEEDLE" ]; then
  echo "[pass] $MESSAGE";
else
  echo "[fail] file $NEEDLE does not exist. $MESSAGE";
  ERROR=1;
fi
