# Qtile keybindings

# from libqtile import qtile
from libqtile.config import Key
from libqtile.command import lazy
from pathlib import Path

# Get home path
home = str(Path.home())
# set mod key to SUPER
mod = "mod4"
# my terminal
MY_TERM = "alacritty"
# my browser
MY_BROWSER = "brave"

keys = [
    # ------------ Window Configs ------------
    Key([mod], "h", lazy.layout.left(), desc="move focus left"),
    Key([mod], "j", lazy.layout.down(), desc="move focus down"),
    Key([mod], "k", lazy.layout.up(), desc="move focus up"),
    Key([mod], "l", lazy.layout.right(), desc="move focus right"),
    Key(
        [mod, "shift"],
        "h",
        lazy.layout.shuffle_left(),
        lazy.layout.move_left().when(layout=["treetab"]),
        desc="move window to the left/move tab left in treetab",
    ),
    Key(
        [mod, "shift"],
        "l",
        lazy.layout.shuffle_right(),
        lazy.layout.move_right().when(layout=["treetab"]),
        desc="move window to the right/move tab right in treetab",
    ),
    Key(
        [mod, "shift"],
        "j",
        lazy.layout.shuffle_down(),
        lazy.layout.section_down().when(layout=["treetab"]),
        desc="move window down/move down a section in treetab",
    ),
    Key(
        [mod, "shift"],
        "k",
        lazy.layout.shuffle_up(),
        lazy.layout.section_up().when(layout=["treetab"]),
        desc="move window downup/move up a section in treetab",
    ),
    Key([mod], "space", lazy.layout.next(), desc="move window focus to other window"),
    Key(
        [mod],
        "equal",
        lazy.layout.grow_left().when(layout=["bsp", "columns"]),
        lazy.layout.grow().when(layout=["monadtall", "monadwide"]),
        desc="Grow window to the left",
    ),
    Key(
        [mod],
        "minus",
        lazy.layout.grow_right().when(layout=["bsp", "columns"]),
        lazy.layout.shrink().when(layout=["monadtall", "monadwide"]),
        desc="Grow window to the left",
    ),
    Key([mod, "shift"], "f", lazy.window.toggle_floating(), desc="toggle float"),
    Key([mod], "Tab", lazy.next_layout(), desc="choose next layout"),
    Key([mod, "shift"], "Tab", lazy.prev_layout(), desc="choose previous layout"),
    Key([mod], "q", lazy.window.kill(), desc="kill focused window"),
    Key([mod], "period", lazy.next_screen(), desc="go to next screen"),
    Key([mod], "comma", lazy.prev_screen(), desc="go to previous screen"),
    # Key([mod], "n", lazy.layout.normalize(), desc="reset all window sizes"),
    Key([mod, "control"], "r", lazy.reload_config(), desc="reload the config"),
    # Key([mod, "control"], "r", lazy.restart(), desc="restart qtile"),
    Key([mod, "control"], "q", lazy.shutdown(), desc="shutdown qtile"),
    # Key(
    #     [mod, "control"],
    #     "m",
    #     lazy.window.minimize_all(),
    #     desc="Toggle hide/show all windows on current group",
    # ),
    # ------------ App Configs ------------
    Key([mod], "m", lazy.spawn("rofi -show drun"), desc="launch apps via rofi"),
    Key([mod, "shift"], "m", lazy.spawn("rofi -show"), desc="nav windows via rofi"),
    Key([mod], "b", lazy.spawn(MY_BROWSER), desc="launch browser"),
    Key([mod], "e", lazy.spawn("thunar"), desc="launch file explorer"),
    Key([mod], "Return", lazy.spawn(MY_TERM), desc="launch terminal"),
    Key(
        [mod, "shift"],
        "Return",
        lazy.spawn(f"{MY_TERM} -e zellij"),
        desc="launch teminal & zellij",
    ),
    Key([mod], "r", lazy.spawn("redshift -O 5000"), desc="change temp color"),
    Key([mod, "shift"], "r", lazy.spawn("redshift -x"), desc="reset redshift"),
    Key(
        [mod],
        "y",
        lazy.spawn("flameshot gui --clipboard --path ~/pics/screenshots"),
        desc="take screenshot and save it on screenshot folder",
    ),
    Key(
        [mod, "shift"],
        "y",
        lazy.spawn("flameshot gui --clipboard"),
        desc="take screenshot and save it on clipboard",
    ),
    Key([mod], "o", lazy.spawn("obsidian"), desc="launch obsidian"),
    Key([mod], "d", lazy.spawn("discord"), desc="launch discord"),
    Key(
        [mod],
        "w",
        lazy.spawn(home + "/dot/scripts/update_wall.sh"),
    ),
    # ------------ Hardware Configs ------------
    Key(
        [mod],
        "F9",
        lazy.spawn("amixer -q set Master 5%-"),
        desc="increase the volume by 5",
    ),
    Key(
        [mod],
        "F10",
        lazy.spawn("amixer -q set Master 5%+"),
        desc="decrease the volume by 5",
    ),
    Key(
        [mod],
        "F11",
        lazy.spawn("amixer -q set Master toggle"),
        desc="toggle between mute and unmute",
    ),
    # Brightness
    Key([], "XF86MonBrightnessUp", lazy.spawn("brightnessctl set +10%")),
    Key([], "XF86MonBrightnessDown", lazy.spawn("brightnessctl set 10%-")),
]

keys.extend(
    [
        Key([mod], "F5", lazy.group["pad"].dropdown_toggle("chatgpt")),
        Key([mod], "F6", lazy.group["pad"].dropdown_toggle("terminal")),
        Key([mod], "F7", lazy.group["pad"].dropdown_toggle("logout")),
        # Key([mod], "F8", lazy.group["6"].dropdown_toggle("scrcpy")),
    ]
)
