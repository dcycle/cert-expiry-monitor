if [ -z "$GlobalRUNID" ]; then
  echo -e '[error] the cleanup hook expects GlobalRUNID to be set'
  exit 1;
else
  rm -rf "$GlobalSCRIPTDIR/tmp/$GlobalRUNID"
fi
