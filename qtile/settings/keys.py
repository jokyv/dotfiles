# Qtile keybindings

from libqtile.config import Key
from libqtile.command import lazy


mod = "mod4"

keys = [
    Key(key[0], key[1], *key[2:])
    for key in [
        # ------------ Window Configs ------------
        # Switch between windows in current stack pane
        ([mod], "j", lazy.layout.down()),
        ([mod], "k", lazy.layout.up()),
        ([mod], "h", lazy.layout.left()),
        ([mod], "l", lazy.layout.right()),
        # Change window sizes (MonadTall)
        ([mod, "shift"], "l", lazy.layout.grow()),
        ([mod, "shift"], "h", lazy.layout.shrink()),
        # Toggle floating
        ([mod, "shift"], "f", lazy.window.toggle_floating()),
        # Move windows up or down in current stack
        ([mod, "shift"], "j", lazy.layout.shuffle_down()),
        ([mod, "shift"], "k", lazy.layout.shuffle_up()),
        # Toggle between different layouts as defined below
        ([mod], "Tab", lazy.next_layout()),
        ([mod, "shift"], "Tab", lazy.prev_layout()),
        # Kill window
        ([mod], "q", lazy.window.kill()),
        # Switch focus of monitors
        ([mod], "period", lazy.next_screen()),
        ([mod], "comma", lazy.prev_screen()),
        # Restart Qtile
        ([mod, "control"], "r", lazy.restart()),
        ([mod, "control"], "q", lazy.shutdown()),
        # ([mod], "r", lazy.spawncmd()),
        # ------------ App Configs ------------
        # Menu
        ([mod], "m", lazy.spawn("rofi -show drun")),
        # Window Navigation
        ([mod, "shift"], "m", lazy.spawn("rofi -show")),
        # Browser
        ([mod], "b", lazy.spawn("brave")),
        # File Explorer
        ([mod], "e", lazy.spawn("thunar")),
        # Terminal
        ([mod], "Return", lazy.spawn("alacritty")),
        ([mod, "shift"], "Return", lazy.spawn("alacritty -e zellij")),
        # Redshift
        ([mod], "r", lazy.spawn("redshift -O 5000")),
        ([mod, "shift"], "r", lazy.spawn("redshift -x")),
        # Screenshot
        ([mod], "y", lazy.spawn("flameshot gui --clipboard --path ~/pics/screenshots")),
        ([mod, "shift"], "y", lazy.spawn("flameshot gui --clipboard")),
        # Obsidian
        ([mod], "o", lazy.spawn("obsidian")),
        # Discord
        ([mod], "d", lazy.spawn("discord")),
        # Wallpaper
        (
            [mod],
            "w",
            lazy.spawncmd("feh --bg-fill $(shuf -n 1 -e ~/pics/wallpapers/*)"),
        ),
        # ------------ Hardware Configs ------------
        # Volume
        (
            [mod],
            "F9",
            lazy.spawn("amixer -q set Master 5%-"),
        ),
        (
            [mod],
            "F10",
            lazy.spawn("amixer -q set Master 5%+"),
        ),
        ([mod], "F11", lazy.spawn("amixer -q set Master toggle")),
        # Brightness
        ([], "XF86MonBrightnessUp", lazy.spawn("brightnessctl set +10%")),
        ([], "XF86MonBrightnessDown", lazy.spawn("brightnessctl set 10%-")),
    ]
]