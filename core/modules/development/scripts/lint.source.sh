echo '[info] About to get ShellCheck metrics'
echo '[info] if you are getting a false negative put:'
echo '[info] => # shellcheck disable=SC2016'

# Note we are excluding SC2034 because most of our files are sourced, and
# we often make use of defining variables in sourced files, but rule SC2034
# does not like this.

# shellcheck disable=SC2086
find . -name "*.sh" -print0 | \
  xargs -0 $DOCKER run --rm -v "$(pwd)":/code dcycle/shell-lint --exclude=SC2034
