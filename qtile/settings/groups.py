# Qtile workspaces

from libqtile.config import Key, Group, Match
from libqtile.command import lazy
from .keys import mod, keys


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
