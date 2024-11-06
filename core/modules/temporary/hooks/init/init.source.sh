#!/bin/bash

function tmp() {
  RUNID=$(argvalue internalrunid)

  LocalTEMPID=$(uuid)
  # shellcheck disable=SC2154
  LocalTMP="$GlobalSCRIPTDIR/tmp/$RUNID/$LocalTEMPID"
  mkdir -p "$LocalTMP"
  echo "$LocalTMP"
}
