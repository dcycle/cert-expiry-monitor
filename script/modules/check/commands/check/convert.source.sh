#!/bin/bash
if hash sw_vers 2>/dev/null; then
  # On mac OS
  CONVERTEDDATE=$(date -jf "%b %d %H:%M:%S %Y %Z" -v -20S "$DATETOCONVERT" "+%s")
else
  CONVERTEDDATE=$(date "+%s" -d "$DATETOCONVERT")
fi
