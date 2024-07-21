# Qtile workspaces

from libqtile.lazy import lazy
from libqtile.config import DropDown, Group, Key, Match, ScratchPad

from .keys import keys, mod

# Get the icons at https://www.nerdfonts.com/cheat-sheet (you need a Nerd Font)
# Icons:
# nf-dev-terminal,
# nf-fa-brave,
# nf-fae-python,
# nf-fa-code,
# nf-oct-git_merge,
# nf-md-discord,
# nf-mdi-image,
# nf-mdi-layers
# nf-md-whatsapp

# groups = [
#     Group(i)
#     for i in [
#         "   ",
#         "   ",
#         "   ",
#         "   ",
#         "   ",
#         " 󰙯  ",
#         "   ",
#         "   ",
#         "   ",
#         # " 󰖣  ",
#     ]
# ]
groups = [
    Group("   ", spawn="alacritty"),
    Group("   ", matches=[Match(wm_class="brave")], spawn="brave"),
    Group("   "),
    Group("   "),
    Group("   "),
    Group(" 󰙯  ", matches=[Match(wm_class="discord")]),
    Group("   "),
    Group("   "),
    Group(" 󰖣  "),
    # "   ",
]


for i, group in enumerate(groups):
    actual_key = str(i + 1)
    keys.extend(
        [
            # Switch to workspace N
            Key([mod], actual_key, lazy.group[group.name].toscreen()),
            # Send window to workspace N
            Key([mod, "shift"], actual_key, lazy.window.togroup(group.name)),
        ]
    )

# --------------------------------------------------------
# Scratchpads
# --------------------------------------------------------

groups.append(
    ScratchPad(
        "pad",
        [
            DropDown(
                "chatgpt",
                "chromium --app=https://chat.openai.com",
                x=0.3,
                y=0.1,
                width=0.40,
                height=0.4,
                opacity=1,
                on_focus_lost_hide=False,
            ),
            DropDown(
                "logout",
                "alacritty -e my_logout.sh",
                x=0.3,
                y=0.1,
                width=0.40,
                height=0.4,
                on_focus_lost_hide=False,
            ),
            DropDown(
                "terminal",
                "alacritty",
                x=0.3,
                y=0.1,
                width=0.40,
                height=0.4,
                on_focus_lost_hide=False,
            ),
            # some more ideas i can use the ScratchPad module
            # blueman-manager for bluetooth
            # scrcpy
            # manage music
            # manage volume
        ],
    )
)
