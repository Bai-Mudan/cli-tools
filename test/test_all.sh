#!/bin/bash

git_root="$(git rev-parse --show-toplevel 2>/dev/null)"

if [[ -z "$git_root" ]]; then
  echo "Not inside a git repository."
  exit 1
fi

overall_status=0
while read -r test_file; do
  echo "Running: $test_file"
  chmod +x "$test_file"
  "$test_file"

  status=$?
  if [[ $status -ne 0 ]]; then
    echo "⚠️  $test_file exited with error code: $status"
    overall_status=1
  else
    echo "✅ $test_file executed successfully."
  fi
done < <(find "$git_root" -type f -name "test.sh")

exit $overall_status