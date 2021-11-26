#!/usr/bin/env bash

main() {
  local full shortened info_char_count
  local MAX_CHARS=${PLAYERCTL_MAX_CHARS:-40}
  full=$(playerctl metadata --format "{{ artist }} - {{ title }}")
  shortened=${full:0:$MAX_CHARS}
  info_char_count=${#full}
  local append=""

  if [[ $info_char_count -gt $MAX_CHARS ]]; then
    append="..."
  fi

  echo "$shortened$append"
}

main
