#!/usr/bin/env bash

base_dir="$HOME/Documents/Warcraft III/CustomMapData/SAVE-TWF/paccao#2579"
default_leveling_file="$base_dir/Lv7-levelling-thief.txt"

show_help() {
  cat <<'EOF'
Usage:
  --character [string]
  --inventory [string]
  --levelling [path]

Examples:
  --character "Arch Druid" --inventory
  --character "Arch Druid" --inventory "/full/path/to/file.txt"
  --levelling
  --levelling "full-file-name.txt"
EOF
}

get_last_match() {
  local file="$1"
  local pattern="$2"
  awk -F'"' -v pat="$pattern" 'index($0, pat) { last=$2 } END { print last }' "$file"
}

find_latest_character_file() {
  local character="$1"
  find "$base_dir" -maxdepth 1 -type f -name "*${character}.txt" | sort -V | tail -n 1
}

copy_character_load() {
  local character="$1"
  local file
  file="$(find_latest_character_file "$character")"

  [[ -z "$file" ]] && {
    echo "No save file found for character: $character" >&2
    exit 1
  }

  get_last_match "$file" 'call Preload( "-load '
}

copy_inventory_load() {
  local character="$1"
  local file="$2"

  if [[ -n "$file" ]]; then
    [[ -f "$file" ]] || {
      echo "Inventory file not found: $file" >&2
      exit 1
    }
  else
    file="$(find_latest_character_file "$character")"
    [[ -z "$file" ]] && {
      echo "No save file found for character: $character" >&2
      exit 1
    }
  fi
  
  get_last_match "$file" 'call Preload( "-load2 '
}

copy_levelling_load() {
  local filename="${1:-$(basename "$default_leveling_file")}"
  local file="$base_dir/$filename"

  [[ ! -f "$file" ]] && {
    echo "Levelling file not found: $file" >&2
    exit 1
  }

  get_last_match "$file" 'call Preload( "-load '
  get_last_match "$file" 'call Preload( "-load2 '
}

character=""
want_character=0
want_inventory=0
want_levelling=0
inventory_file=""
levelling_file=""

while [[ $# -gt 0 ]]; do
  case "$1" in
    -c|--character)
      if [[ $# -lt 2 || -z "${2:-}" || "${2:0:2}" == "--" ]]; then
        echo "Error: --character requires a value" >&2
	show_help
	exit 1
      fi
      character="$2"
      want_character=1
      shift 2
      ;;

    -i|--inventory)
      want_inventory=1
      if [[ $# -ge 2 && -n "${2:-}" && "${2:0:2}" != "-" ]]; then
        inventory_file="$2"
        shift 2
      else
        shift 1
      fi
      ;;

    -l|--levelling)
      want_levelling=1
      if [[ $# -ge 2 && -n "${2:-}" && "${2:0:1}" != "-" ]]; then
        levelling_file="$2"
        shift 2
      else
        shift 1
      fi
      ;;

    -h|--help)
      show_help
      exit 0
      ;;

    *)
      echo "Error: unknown argument: $1" >&2
      show_help
      exit 1
      ;;
  esac
done

if [[ "$want_levelling" -eq 1 ]]; then
  copy_levelling_load "$levelling_file"
  exit 0
fi

output=()

if [[ "$want_character" -eq 1 ]]; then
  output+=("$(copy_character_load "$character")")
fi

if [[ "$want_inventory" -eq 1 ]]; then
  if [[ -n "$inventory_file" ]]; then
    output+=("$(copy_inventory_load "" "$inventory_file")")
  else
    [[ -n "$character" ]] || {
      echo "Error: --inventory without a file requires --character first." >&2
      exit 1
    }
    output+=("$(copy_inventory_load "$character")")
  fi
fi

if [[ "${#output[@]}" -gt 0 ]]; then
  printf '%s\n' "${output[@]}"
else
  show_help
fi
