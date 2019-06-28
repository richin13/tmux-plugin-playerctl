#!/usr/bin/env bash

main() {
  playerctl metadata --format "{{ artist }} - {{ title }}"
}

main
