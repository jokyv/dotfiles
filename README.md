# My configs for Arch on Wayland

## Applications

- Window sytem: [Wayland](https://wayland.freedesktop.org/)
- Wayland Compositor: [Niri](https://github.com/YaLTeR/niri)
- Terminal: [Alacritty](https://github.com/alacritty/alacritty)
- Editor: [Helix](https://github.com/helix-editor/helix)
- Prompt: [Starship](https://github.com/starship/starship)
- Fonts: [Hack Nerd Font](https://www.nerdfonts.com/)
- Application Launcher: [Fuzzel](https://codeberg.org/dnkl/fuzzel)
- Colorscheme: [Everforest](https://github.com/sainnhe/everforest)
- Browsers: [Brave](https://github.com/brave/brave-browser) and [Firefox](https://www.mozilla.org/en-US/firefox/)
- Filemanager: [Nautilus](https://gitlab.gnome.org/GNOME/nautilus)
- Status Bar: [Waybar](https://github.com/Alexays/Waybar)
- Sreenshots: [Gnome-Screenshot](https://gitlab.gnome.org/GNOME/gnome-screenshot)

## Archived configs

### QTILE

### BSPWM

## Instalation

```bash
git clone https://github.com/jokyv/dotfiles.git ~/repos/dot
```

## Notes

- just `CTL` or `CTL` + `Shift` reserved for Alacritty shortcuts.
- just `Super Key` or `Super Key` + `Shift` for Qtile shortcuts.

## Roadmap

- [x] version 2.x
  - improving dotfiles
  - improving scripts
  - documentation - README.md
  - stabilize everything before moving to wayland and new wm
- [x] version 3.0
  - [x] move to qtile
  - [x] move away from x11 only WM such as bspwm
- [x] version 4.0
  - move to wayland using niri
  - replace x11 apps with wayland apps
- [ ] version 5.0
  - wayland with niri or qtile option
  - replace ranger with rust based file manager
- [ ] version 6.0
  - [ ] move to NixOS
  - [ ] merge arch installation and dotfiles
