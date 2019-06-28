#!/usr/bin/env bash

main() {
  playerctl metadata --format "{{ artist }}"
}

main
