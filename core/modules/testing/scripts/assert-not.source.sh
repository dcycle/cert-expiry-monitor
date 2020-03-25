# shellcheck disable=SC2015
echo "$HAYSTACK" | grep "$NEEDLE" >> /dev/null && { echo "[fail] $NEEDLE found in $HAYSTACK. Failed: $MESSAGE"; ERROR=1; } || { echo "[pass] $MESSAGE."; }
