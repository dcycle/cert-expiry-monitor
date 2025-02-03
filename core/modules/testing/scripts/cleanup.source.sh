#!/bin/bash

if [[ "$ERROR" -eq 1 ]]; then
  # shellcheck disable=SC2128
  echo -e "[error] $(basename "$BASH_SOURCE") Error has been detected, returning 1."
  exit 1
else
  # shellcheck disable=SC2128
  echo -e "[pass] $(basename "$BASH_SOURCE") No error detected, returning 0."
  exit 0
fi
