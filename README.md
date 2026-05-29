# dotfiles

A repo to keep track of my dotfiles and make it simple to install them on a new machine.

## Dependencies

Essential apps:

`i3wm, picom, xorg, alacritty, fish, polybar, pipewire`

Optional apps:

`zed IDE, mullvad VPN, OpenRGB, keepassxc, pavucontrol, discord, ripgrep, fzf`

## Setup:

```sh
git clone --depth=1 git@github.com:paccao/dotfiles.git

# List all scripts and give owner full rights. Group and others gets read-only.
find dotfiles/scripts/ -type f -iname "*.sh" -exec chmod 744 {} \;
find dotfiles/.config/polybar/scripts/ -type f -iname "*.sh" -exec chmod 744 {} \;

# Be careful with these
cp -a dotfiles/. ~/
rm -rf ~/.git
rm -i ~/README.md
```

In `scripts/update-remote-dotfiles.sh` update the `TARGET` var to the destination where u cloned dotfiles.

Done!

## Update

The script `scripts/update-remote-dotfiles.sh` copies files from your home dir to the git repo, in order to push changes to remote easier.

You can also use tools like [chezmoi](https://www.chezmoi.io/) for this.

## Considerations

Some apps store cached passwords, db files, logs etc in `.config/` and you don't want to commit those.

Be specific when u add paths in the var SOURCES in `scripts/update-remote-dotfiles.sh`.

## Resources

- [all about dotfiles](https://dotfiles.github.io/)
- [chmod explanations](https://chmodcommand.com/chmod-744/)
