#!/bin/bash

function invoke-all () {
  # shellcheck disable=SC2154
  source "$GlobalSCRIPTDIR/core/modules/extensibility/scripts/invoke-all.source.sh" "$1"
}
