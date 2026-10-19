#!/usr/bin/env bash
set -euo pipefail
unalias cp 2>/dev/null || true

TARGET="$HOME/c/dotfiles"

DOTFILES=(
  "$HOME/.config/alacritty/alacritty.toml"
  "$HOME/.config/autostart/mullvad-vpn.desktop"
  "$HOME/.config/autostart/OpenRGB.desktop"
  "$HOME/.config/fish/config.fish"
  "$HOME/.config/i3/config"
  "$HOME/.config/i3/wallpaper.png"
  # "$HOME/.config/OpenRGB/k95 orange.orp"
  "$HOME/.config/picom/picom.conf"
  "$HOME/.config/polybar/scripts/arch_updates.sh"
  "$HOME/.config/polybar/scripts/localip.sh"
  "$HOME/.config/polybar/scripts/network-networkmanager.sh"
  "$HOME/.config/polybar/scripts/pipewire-simple.sh"
  "$HOME/.config/polybar/config"
  "$HOME/.config/polybar/launch.sh"
  "$HOME/.config/zed/settings.json"
  "$HOME/.config/pavucontrol.ini"
  "$HOME/.local/share/rofi/themes/GPL-3.0_squared-everforest.rasi"
  "$HOME/.bash_profile"
  "$HOME/.bashrc"
  "$HOME/.gitconfig"
  "$HOME/.profile"
  "$HOME/.tmux.conf"
  "$HOME/.Xresources"
  "$HOME/.xsession"
  "$HOME/.zshrc"
)

SCRIPTS=(
  "$HOME/scripts/xsession-startup.sh"
  "$HOME/scripts/launch-chromium.sh"
  "$HOME/scripts/layout-toggler.sh"
  "$HOME/scripts/mouse-jiggle.sh"
  "$HOME/scripts/revo-copy-last-load.sh"
  "$HOME/scripts/revo-load-levelling-char.sh"
  "$HOME/scripts/teve/teve-copy-last-load.sh"
  "$HOME/scripts/teve/teve-final-levelling.sh"
  "$HOME/scripts/tevo-leveling-script.sh"
)

copy_files() {
  local base="$1"
  shift
  local src rel dest

  for src in "$@"; do
    if [ ! -e "$src" ]; then
      echo "Error: source not found: $src" >&2
      exit 2
    fi

    rel="${src#"$base"/}"
    dest="$TARGET/$rel"

    # This creates all parent directories automatically
    mkdir -p -- "$(dirname -- "$dest")"
    cp -a -- "$src" "$dest" || { echo "Failed to copy $src" >&2; exit 3; }
    echo "Copied: $src -> $dest"
  done
}

copy_files "$HOME" "${DOTFILES[@]}"
copy_files "$HOME" "${SCRIPTS[@]}"
