ARG="$1"
NAME=$(sed 's/=.*$//g' <<< "$ARG")
NAME=$(sed 's/--//g' <<< "$NAME")
VALUE=$(sed 's/^--.*=//g' <<< "$ARG")

if [ -z "$VALUE" ]; then
  VALUE=1
fi
