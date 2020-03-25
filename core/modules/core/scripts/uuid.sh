# Returns a unique string

if [ -f /proc/sys/kernel/random/uuid ]
  then
    cat /proc/sys/kernel/random/uuid
else
  # Mac OS X does not have the uuid utility, use random numbers instead:
  echo $RANDOM$RANDOM$RANDOM
fi
