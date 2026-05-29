# dotfiles

A repo to keep track of my dotfiles and make it simple to install them on a new machine.

## Dependencies

Essential apps:

`i3wm, picom, xorg, alacritty, fish, polybar`

Optional apps:

`zed IDE, mullvad VPN, OpenRGB, keepassxc, pavucontrol, discord, ripgrep, fzf`

## Setup:

```sh
git clone --depth=1 git@github.com:paccao/dotfiles.git

# List all scripts and give owner full rights. Group and others gets read-only.
find dotfiles/scripts/ -type f -iname "*.sh" -exec chmod 744 {} \;
find dotfiles/.config/polybar/scripts/ -type f -iname "*.sh" -exec chmod 744 {} \;

# Be careful with these
cp -i -a dotfiles/. ~/
rm -rf ~/.git
rm -i ~/README.md
```


## Resources

- [all about dotfiles](https://dotfiles.github.io/)
- [chmod explanations](https://chmodcommand.com/chmod-744/)
