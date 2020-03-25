if [ "$(argvalue debug)" == '1' ]; then
  echo -e "-----"
  echo -e "Printing full log because you set the --debug flag."
  echo -e "-----"
  printf '%s\n' "${LOG[@]}"
fi
