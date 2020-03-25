# See https://github.com/koalaman/shellcheck/wiki/SC2144
set -e

LocalGLOBEXISTS='false'
for file in $1; do
  if [ -e "$file" ]; then
    LocalGLOBEXISTS='true'
  fi
done
echo "$LocalGLOBEXISTS"

