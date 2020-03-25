if [[ "$ERROR" -eq 1 ]]; then
  echo -e "[error] $(basename "$BASH_SOURCE") Error has been detected, returning 1."
  exit 1
else
  echo -e "[pass] $(basename "$BASH_SOURCE") No error detected, returning 0."
  exit 0
fi
