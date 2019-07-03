#!/usr/bin/env bash

main() {
  local MAX_CHARS=10
  local full=$(playerctl metadata --format "{{ artist }} - {{ title }}")
  local shorten=$(echo $full | cut -c 1-$MAX_CHARS)
  local info_char_count=$(echo $full | wc -c)
  local append=""

  if [[ $info_char_count -gt $MAX_CHARS ]]; then
    append="..."
  fi

  echo "$shorten$append"
}

main
