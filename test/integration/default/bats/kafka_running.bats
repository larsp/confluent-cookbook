#!/usr/bin/env bats

@test "kafka is running" {
  run systemctl status kafka
  [ "$status" -eq 0 ]
}
