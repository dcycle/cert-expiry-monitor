for f in $(development_get_all_tests); do
  output list-element:"$f" 'info' "$f"
done
