function tmp() {
  RUNID=$(argvalue internalrunid)

  LocalTEMPID=$(uuid)
  LocalTMP="$GlobalSCRIPTDIR/tmp/$RUNID/$LocalTEMPID"
  mkdir -p "$LocalTMP"
  echo "$LocalTMP"
}
