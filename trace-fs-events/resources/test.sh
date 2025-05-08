#!/bin/bash

git_root="$(git rev-parse --show-toplevel 2>/dev/null)"

"$git_root"/test/bats/bin/bats "$git_root"/trace-fs-events/resources/test.bats
