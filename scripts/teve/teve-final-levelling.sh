#!/usr/bin/env bash
set -euo pipefail

script="$HOME/scripts/teve/teve-copy-last-load.sh"
#character="Thief-30-levelling"
character="Rogue"

type_line() {
  local line="$1"
  xdotool type --clearmodifiers --delay 1 -- "$line"
  xdotool key --clearmodifiers Return
}

return_sleep() {
  xdotool key --clearmodifiers Return
  sleep 0.3
}

mode="${1:-}"

case "$mode" in
  --levelling)
    mapfile -t lines < <("$script" --levelling | sed '/^$/d')
    ;;
  "")
    mapfile -t lines < <("$script" --character "$character" --inventory | sed '/^$/d')
    ;;
  *)
    echo "Usage: $0 [--levelling]" >&2
    exit 1
    ;;
esac

[[ "${#lines[@]}" -ge 2 ]] || {
  echo "Error: Expected 2 lines, got ${#lines[@]}" >&2
  exit 1
}

return_sleep
type_line "-repick"
return_sleep
type_line "${lines[0]}"
return_sleep
type_line "${lines[1]}"
