#!/usr/bin/env bash

# Kill old copy of this script if it exists
pkill -f "$0" 2>/dev/null

# Give the old one a moment to exit
sleep 0.5

# Keyboard layout
KBD_LAYOUT="se,us"

# Apps that should NOT get caps:swapescape
IGNORE_CLASSES=(
  "Minecraft* 1.21.1"
)

NORMAL_OPTS=(-layout $KBD_LAYOUT -option grp:win_space_toggle)
SWAP_OPTS=(-layout $KBD_LAYOUT -option caps:swapescape -option grp:win_space_toggle)

get_active_wmclass() {
  local win class
  win=$(xprop -root _NET_ACTIVE_WINDOW | awk -F' ' '{print $5}')
  [ -z "$win" ] && return 1
  class=$(xprop -id "$win" WM_CLASS 2>/dev/null | awk -F'"' '{print $2 " " $4}')
  printf '%s\n' "$class"
}

matches_ignore() {
  local current="$1"
  local pat
  for pat in "${IGNORE_CLASSES[@]}"; do
    case "$current" in
      *"$pat"*) return 0 ;;
    esac
  done
  return 1
}

apply_layout() {
  local current
  current="$(get_active_wmclass)" || return 0

  if matches_ignore "$current"; then
    setxkbmap "${NORMAL_OPTS[@]}"
  else
    setxkbmap "${SWAP_OPTS[@]}"
  fi
}

# Apply once at start
apply_layout

# Watch focus changes
prev=""
while sleep 0.25; do
  cur="$(xprop -root _NET_ACTIVE_WINDOW 2>/dev/null)"
  if [ "$cur" != "$prev" ]; then
    prev="$cur"
    apply_layout
  fi
done

