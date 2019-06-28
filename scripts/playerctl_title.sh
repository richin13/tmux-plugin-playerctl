#!/usr/bin/env bash

main() {
  playerctl metadata --format "{{ title }}"
}

main
