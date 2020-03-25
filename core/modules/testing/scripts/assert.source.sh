# shellcheck disable=SC2015
echo "$HAYSTACK" | grep "$NEEDLE" >> /dev/null && { echo "[pass] $MESSAGE"; } || { echo "[fail] $NEEDLE not found in $HAYSTACK. Failed: $MESSAGE"; ERROR=1; }
