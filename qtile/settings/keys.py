# NOTES
# -----------------------------------------------
"""
    Use `c` to kill instead of `q`
"""
# -----------------------------------------------
# Qtile keybindings

from pathlib import Path

from libqtile.command import lazy
from libqtile.config import Key

# VARIABLES
# -----------------------------------------------
# Get home path
home = str(Path.home())
# set mod key to SUPER
mod = "mod4"
# my terminal
MY_TERM = "alacritty"
# my browser
MY_BROWSER = "brave"


# FUNCTIONS
# -----------------------------------------------
@lazy.function
def minimize_all(qtile):
    """A function for hide/show all the windows in a group"""
    for win in qtile.current_group.windows:
        if hasattr(win, "toggle_minimize"):
            win.toggle_minimize()


@lazy.function
def maximize_by_switching_layout(qtile):
    """A function for toggling between MAX and MONADTALL layouts"""
    current_layout_name = qtile.current_group.layout.name
    if current_layout_name == "monadtall":
        qtile.current_group.layout = "max"
    elif current_layout_name == "max":
        qtile.current_group.layout = "monadtall"


# KEYS
# -----------------------------------------------
keys = [
    # ------------ Screen Configs ------------
    Key([mod, "control"], "1", lazy.to_screen(0), desc="move focus to the screen 0"),
    Key([mod, "control"], "2", lazy.to_screen(1), desc="move focus to the screen 1"),
    Key([mod, "control"], "period", lazy.next_screen(), desc="go to next screen"),
    Key([mod, "control"], "comma", lazy.prev_screen(), desc="go to previous screen"),
    # ------------ Window focus Configs ------------
    Key([mod], "h", lazy.layout.left(), desc="move focus left"),
    Key([mod], "j", lazy.layout.down(), desc="move focus down"),
    Key([mod], "k", lazy.layout.up(), desc="move focus up"),
    Key([mod], "l", lazy.layout.right(), desc="move focus right"),
    # ------------ Window move Configs ------------
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
    Key(
        [mod],
        "space",
        lazy.layout.next(),
        desc="move the window focus to another window",
    ),
    # ------------ Resize window Configs ------------
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
    # ------------ Fullscreen / Floating window Configs ------------
    Key(
        [mod],
        "f",
        lazy.window.toggle_fullscreen(),
        desc="toggle a window to fullscreen",
    ),
    Key(
        [mod, "shift"],
        "f",
        lazy.window.toggle_floating(),
        desc="toggle a window to floating",
    ),
    # ------------ Layout Configs ------------
    Key([mod], "Tab", lazy.next_layout(), desc="choose the next layout"),
    Key([mod, "shift"], "Tab", lazy.prev_layout(), desc="choose the previous layout"),
    Key([mod], "q", lazy.window.kill(), desc="kill the focused window immediately"),
    Key(
        [mod],
        "n",
        lazy.layout.normalize(),
        desc="reset all window sizes - currently does not work",
    ),
    Key(
        [mod, "control"],
        "r",
        lazy.reload_config(),
        desc="reload the qtile's config file",
    ),
    # Key([mod, "control"], "r", lazy.restart(), desc="restart qtile"),
    Key(
        [mod, "control"],
        "q",
        lazy.shutdown(),
        desc="quit/shutdown the whole qtile application",
    ),
    Key(
        [mod, "control"],
        "m",
        minimize_all(),
        desc="Toggle hide/show all windows on current group",
    ),
    # Key(
    #     [mod],
    #     "f",
    #     maximize_by_switching_layout(),
    #     lazy.window.toggle_fullscreen(),
    #     desc="toggle fullscreen (better way!)",
    # ),
    # ------------ App Configs ------------
    Key(
        [mod],
        "m",
        lazy.spawn("rofi -show drun"),
        desc="launch any of your apps via rofi",
    ),
    Key(
        [mod, "shift"],
        "m",
        lazy.spawn("rofi -show window"),
        desc="nav windows via rofi",
    ),
    Key(
        [mod],
        "b",
        lazy.spawn(MY_BROWSER),
        desc="launch the browser you specified with the MY_BROWSER variable",
    ),
    Key(
        [mod, "shift"],
        "b",
        lazy.spawn(home + "/dot/scripts/bravebookmarks.sh"),
        desc="launch rofi with brave bookmarks to run",
    ),
    Key(
        [mod],
        "e",
        lazy.spawn("thunar"),
        desc="launch your file explorer - currently thunar",
    ),
    Key(
        [mod],
        "Return",
        lazy.spawn(MY_TERM),
        desc="launch the terminal you specified with MY_TERM variable",
    ),
    Key(
        [mod, "shift"],
        "Return",
        lazy.spawn(f"{MY_TERM} -e zellij"),
        desc="launch teminal & zellij together",
    ),
    Key(
        [mod],
        "r",
        lazy.spawn("redshift -O 5000"),
        desc="change temp color of your screen",
    ),
    Key(
        [mod, "shift"],
        "r",
        lazy.spawn("redshift -x"),
        desc="reset temp color of your screen",
    ),
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
    Key([mod], "o", lazy.spawn("obsidian"), desc="launch the application obsidian"),
    Key([mod], "d", lazy.spawn("discord"), desc="launch the application discord"),
    # ------------ Update wallpaper script ------------
    Key(
        [mod],
        "w",
        lazy.spawn(home + "/dot/scripts/update_wall.sh"),
    ),
    # ------------ Hardware Configs ------------
    # Sound
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
    Key(
        [mod, "control"],
        "equal",
        "XF86MonBrightnessUp",
        lazy.spawn("brightnessctl set +10%"),
    ),
    Key(
        [mod, "control"],
        "minus",
        "XF86MonBrightnessDown",
        lazy.spawn("brightnessctl set 10%-"),
    ),
]

# scratchpad
keys.extend(
    [
        Key([mod], "F5", lazy.group["pad"].dropdown_toggle("chatgpt")),
        Key([mod], "F6", lazy.group["pad"].dropdown_toggle("terminal")),
        Key([mod], "F7", lazy.group["pad"].dropdown_toggle("logout")),
        # Key([mod], "F8", lazy.group["6"].dropdown_toggle("scrcpy")),
    ]
)
