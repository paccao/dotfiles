# dotfiles

A repo to keep track of my dotfiles and make it simple to install them on a new machine.

## Dependencies

Essential apps:

`i3wm, picom, xorg, alacritty, fish, polybar`

Optional apps:

`zed IDE, mullvad VPN, OpenRGB, keepassxc, pavucontrol, discord`

## Setup:

```sh
git clone --depth=1 git@github.com:paccao/dotfiles.git

# Careful with these
cp -i -a dotfiles/. ~/
rm -rf ~/.git
rm -i ~/README.md
```

## Resources

[https://dotfiles.github.io/](https://dotfiles.github.io/)
