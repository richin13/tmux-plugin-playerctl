#!/usr/bin/env bash

main() {
  playerctl metadata --format "{{ album }}"
}

main
