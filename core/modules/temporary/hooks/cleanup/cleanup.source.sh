#!/bin/bash

if [ -z "$GlobalRUNID" ]; then
  echo -e '[error] the cleanup hook expects GlobalRUNID to be set'
  exit 1;
else
  # shellcheck disable=SC2154
  rm -rf "$GlobalSCRIPTDIR/tmp/$GlobalRUNID"
fi
