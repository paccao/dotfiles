#!/usr/bin/env bash
set -euo pipefail
unalias cp 2>/dev/null || true

# Update this to where u cloned the dotfiles repo /path/to/dotfiles-git-repo
TARGET="$HOME/c/dotfiles"

# List of files to copy. Be specific, don't use wildcards.
SOURCES=(
  "$HOME/.config/alacritty/alacritty.toml"
  "$HOME/.config/autostart/mullvad.desktop"
  "$HOME/.config/autostart/OpenRGB.desktop"
  "$HOME/.config/fish/config.fish"
  "$HOME/.config/fish/fish_variables"
  "$HOME/.config/i3/config"
  "$HOME/.config/i3/wallpaper.png"
  "$HOME/.config/keepassxc/keepassxc.ini"
  "$HOME/.config/OpenRGB/k95 orange.orp"
  "$HOME/.config/picom/picom.conf"
  "$HOME/.config/polybar/scripts/arch_updates.sh"
  "$HOME/.config/polybar/scripts/localip.sh"
  "$HOME/.config/polybar/scripts/network-networkmanager.sh"
  "$HOME/.config/polybar/scripts/pipewire-simple.sh"
  "$HOME/.config/polybar/config"
  "$HOME/.config/polybar/launch.sh"
  "$HOME/.config/zed/settings.json"
  "$HOME/.config/pavucontrol.ini"
  "$HOME/.bash_profile"
  "$HOME/.bashrc"
  "$HOME/.gitconfig"
  "$HOME/.profile"
  "$HOME/.tmux.conf"
  "$HOME/.Xresources"
  "$HOME/.xsession"
  "$HOME/.zshrc"
)

for src in "${SOURCES[@]}"; do
  if [ ! -e "$src" ]; then
    echo "Error: source not found: $src" >&2
    exit 2
  fi
  cp -a -- "$src" "$TARGET/" || { echo "Failed to copy $src" >&2; exit 3; }
  echo "Copied: $src -> $TARGET/"
done
