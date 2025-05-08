#!/usr/bin/env bats

setup() {
    load "$(git rev-parse --show-toplevel 2>/dev/null)/test/test_helper/bats-support/load"
    load "$(git rev-parse --show-toplevel 2>/dev/null)/test/test_helper/bats-assert/load"

    DIR="$(git rev-parse --show-toplevel 2>/dev/null)/trace-fs-events"
    PATH="$DIR:$PATH"
}

@test "detects file read" {
  echo "hello" > tmp_read.txt
  run traceFsEvents cat tmp_read.txt
  [ "$status" -eq 0 ]
  assert_output --partial 'Read: tmp_read.txt'
  rm tmp_read.txt
}

@test "detects file write" {
  run traceFsEvents bash -c "echo 'hi' > tmp_write.txt"
  [ "$status" -eq 0 ]
  assert_output --partial 'Write: tmp_write.txt'
  rm tmp_write.txt
}

@test "detects file append (write)" {
  echo "start" > tmp_append.txt
  run traceFsEvents bash -c "echo 'more' >> tmp_append.txt"
  [ "$status" -eq 0 ]
  assert_output --partial 'Write: tmp_append.txt'
  rm tmp_append.txt
}

@test "detects file delete" {
  echo "bye" > tmp_delete.txt
  run traceFsEvents bash -c "rm tmp_delete.txt"
  [ "$status" -eq 0 ]
  assert_output --partial 'Delete: tmp_delete.txt'
}
