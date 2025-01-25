My configs for Arch on Wayland

> [!IMPORTANT]
> Current status
> I have switched to [Nixos-config](https://github.com/jokyv/nixos-config) but those dotfiles can still be used with MacOS.

To easily start with this config run [archinstall](https://wiki.archlinux.org/title/Archinstall) with min packages.

## Requirements

This dotfiles support Arch linux based distros only.

- EndeavourOS
- Manjaro
- Arch

## Applications

- Window system: [Wayland](https://wayland.freedesktop.org/)
- Wayland Compositor: [Niri](https://github.com/YaLTeR/niri)
- ~~Terminal: [Alacritty](https://github.com/alacritty/alacritty)~~
- Terminal: [Kitty](https://github.com/kovidgoyal/kitty) and [foot](https://codeberg.org/dnkl/foot)
- Editor: [Helix](https://github.com/helix-editor/helix)
- Prompt: [Starship](https://github.com/starship/starship)
- Browser: [Firefox](https://www.mozilla.org/en-US/firefox) and [Brave](https://github.com/brave/brave-browser)
- Fonts: [Hack Nerd Font](https://www.nerdfonts.com/)
- Colorscheme: [Everforest](https://github.com/sainnhe/everforest)
- Application Launcher: [Fuzzel](https://codeberg.org/dnkl/fuzzel)
- File manager: [Nautilus](https://gitlab.gnome.org/GNOME/nautilus)
- Status Bar: [Waybar](https://github.com/Alexays/Waybar)
- Screenshots: [Grim](https://github.com/emersion/grim)/[slurp](https://github.com/emersion/slurp)/[swappy](https://github.com/jtheoof/swappy) or [Gnome-Screenshot](https://gitlab.gnome.org/GNOME/gnome-screenshot)
- Clipboard manager: [Cliphist](https://github.com/sentriz/cliphist) and [wl-clipboard](https://github.com/bugaevc/wl-clipboard)
- Document viewer: [Zathura](https://github.com/pwmt/zathura)
- Login Manager: [Ly](https://github.com/fairyglade/ly)
- Notification daemon: [Mako](https://github.com/emersion/mako)
- Power Menu: [Wlogout](https://github.com/ArtsyMacaw/wlogout)
- Screenlock: [Swaylock](https://github.com/swaywm/swaylock)

## Archived configs file

It contains config files for past used applications, such as:

- Xserver
- Window managers: QTILE, BSPWM
- Terminals: alacritty
- rofi
- polybar
- dunst
- erdtree

## Documentation (Wiki)

You can find the complete documentation of the dotfiles in the Wiki. <b>[Open the Wiki here](https://github.com/jokyv/dotfiles/wiki)</b>

## Installation

```bash
git clone https://github.com/jokyv/dotfiles.git ~/repos/dot
cd repos/dot/.install
./system_bootstrap.sh
```

## Key Binding notes

- Just `Ctrl` or `Ctrl` + `Shift` reserved mainly for Terminal shortcuts.
- Just `Super Key` or `Super Key` + `Shift` mainly for WM shortcuts.

## Wallpaper repository

You can find my wallpaper collection in [this repository](https://github.com/jokyv/wallpapers).
