if [ -f "$GlobalSCRIPTDIR"/script/modules/header/files/header.txt ]; then
  cat "$GlobalSCRIPTDIR"/script/modules/header/files/header.txt
else
  cat "$GlobalSCRIPTDIR"/core/modules/header/files/header.txt
fi
