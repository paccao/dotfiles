#!/usr/bin/env bash
set -euo pipefail

FullURL="$(curl -fsSLI 'https://discord.com/api/download?platform=linux&format=tar.gz' \
  | awk -F': ' '/[Ll]ocation/ {print $2}' | tr -d '\r')"

TmpFile="/tmp/${FullURL##*/}"

if [[ -f "$TmpFile" ]]; then
  echo "$TmpFile found — Discord is probably up to date."
  echo ""
else
  echo ""
  echo "$TmpFile NOT found — downloading..."
  curl -fSL -o "$TmpFile" "$FullURL"
  mkdir -p "$HOME/bin"
  tar -xzf "$TmpFile" --directory="$HOME/bin"
  if [[ -f "$HOME/bin/Discord/chrome-sandbox" ]]; then
    chmod 4755 "$HOME/bin/Discord/chrome-sandbox"
  fi
  rm -f "$TmpFile"
fi

exit 0
