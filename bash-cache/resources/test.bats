#!/usr/bin/env bats

setup() {
    load "$(git rev-parse --show-toplevel 2>/dev/null)/test/test_helper/bats-support/load"
    load "$(git rev-parse --show-toplevel 2>/dev/null)/test/test_helper/bats-assert/load"

    DIR="$(git rev-parse --show-toplevel 2>/dev/null)/bash-cache"
    PATH="$DIR:$PATH"
}


@test "minute_cache sleep 1" {
    rm -rf /tmp/cache_store

    SECONDS=0
    run minute_cache sleep 1
    local duration=$SECONDS
    [ "$duration" -ge 1 ]

    SECONDS=0
    run minute_cache sleep 1
    duration=$SECONDS
    [ "$duration" -lt 1 ]
}


@test "minute_cache bash -c \"echo Hello && sleep 1 > a.txt\"" {
    rm -rf /tmp/cache_store

    SECONDS=0
    run minute_cache bash -c "echo Hello && sleep 1 > a.txt"
    local duration=$SECONDS
    [ "$duration" -ge 1 ]

    SECONDS=0
    run minute_cache bash -c "echo Hello && sleep 1 > a.txt"
    duration=$SECONDS
    [ "$duration" -lt 1 ]
}

