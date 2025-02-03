#!/bin/bash
# shellcheck disable=SC2154
if [ -f "$GlobalSCRIPTDIR"/script/modules/header/files/header.txt ]; then
  cat "$GlobalSCRIPTDIR"/script/modules/header/files/header.txt
else
  cat "$GlobalSCRIPTDIR"/core/modules/header/files/header.txt
fi
