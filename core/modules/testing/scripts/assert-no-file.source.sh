if [ -f "$NEEDLE" ]; then
  echo "[fail] file $NEEDLE cannot exist. $MESSAGE";
  ERROR=1;
else
  echo "[pass] $MESSAGE";
fi
