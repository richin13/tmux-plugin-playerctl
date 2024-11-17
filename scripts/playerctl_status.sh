#!/usr/bin/env bash

CWD="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

source "$CWD/helpers.sh"

#: Options
playing_option_name="@status_playing"
paused_option_name="@status_paused"
stopped_option_name="@status_stopped"

#: Default values for options
default_stopped="⏹"
default_playing="▶"
default_paused="⏸"


main() {
  local status stopped playing paused status_icon
  status=$(playerctl status)

  playing=$(get_tmux_option "$playing_option_name" "$default_playing")
  paused=$(get_tmux_option "$paused_option_name" "$default_paused")
  stopped=$(get_tmux_option "$stopped_option_name" "$default_stopped")

  case $status in
    "Playing")
      status_icon=$playing
      ;;
    "Paused")
      status_icon=$paused
      ;;
    *)
      status_icon=$stopped
      ;;
  esac

  echo "$status_icon"
}

main
