# dotfiles

A repo to keep track of my dotfiles and make it simple to install them on a new machine.

## Dependencies

Essential apps:

`i3wm, picom, xorg, alacritty, fish, polybar`

Optional apps:

`zed editor, mullvad VPN, OpenRGB, Keepassxc, pavucontrol, discord`

## Setup:

```sh
git clone --depth=1 git@github.com:paccao/dotfiles.git

# Careful with these
cp -a dotfiles/. ~
rm -rf ~/.git README.md
```
