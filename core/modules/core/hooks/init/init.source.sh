function uuid() {
  if [ -f /proc/sys/kernel/random/uuid ]; then
    LocalTEMPID=$(cat /proc/sys/kernel/random/uuid)
  else
    # Mac OS X does not have the uuid utility, use random numbers instead,
    # even though this script does not officially support Mac OS X.
    LocalTEMPID="$RANDOM$RANDOM$RANDOM"
  fi
  echo "$LocalTEMPID"
}
