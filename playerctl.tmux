#!/usr/bin/env bash

CWD="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

source "$CWD/scripts/helpers.sh"

playerctl_short="#($CWD/scripts/playerctl_short.sh)"
playerctl_short_interpolation="\#{playerctl_short}"

playerctl_full="#($CWD/scripts/playerctl_full.sh)"
playerctl_full_interpolation="\#{playerctl_full}"

playerctl_title="#($CWD/scripts/playerctl_title.sh)"
playerctl_title_interpolation="\#{playerctl_title}"

playerctl_artist="#($CWD/scripts/playerctl_artist.sh)"
playerctl_artist_interpolation="\#{playerctl_artist}"

playerctl_album="#($CWD/scripts/playerctl_album.sh)"
playerctl_album_interpolation="\#{playerctl_album}"

playerctl_status="#($CWD/scripts/playerctl_status.sh)"
playerctl_status_interpolation="\#{playerctl_status}"

do_interpolation() {
  local string=$1
  local string=${string/$playerctl_short_interpolation/$playerctl_short}
  local string=${string/$playerctl_full_interpolation/$playerctl_full}
  local string=${string/$playerctl_title_interpolation/$playerctl_title}
  local string=${string/$playerctl_artist_interpolation/$playerctl_artist}
  local string=${string/$playerctl_album_interpolation/$playerctl_album}
  local string=${string/$playerctl_status_interpolation/$playerctl_status}
  echo "$string"
}

update_tmux_option() {
  local option="$1"
  local option_value, new_option_value
  option_value="$(get_tmux_option "$option")"
  new_option_value="$(do_interpolation "$option_value")"

  tmux set-option -gq "$option" "$new_option_value"
}

main() {
  update_tmux_option "status-right"
  update_tmux_option "status-left"
}

main
