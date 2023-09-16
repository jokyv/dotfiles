from libqtile import widget
from .theme import colors

# Get the icons at https://www.nerdfonts.com/cheat-sheet (you need a Nerd Font)


# add basic color config
def base(fg="text", bg="dark"):
    return {"foreground": colors[fg], "background": colors[bg]}


# add seperation
def separator():
    return widget.Sep(**base(), linewidth=0, padding=5)


# add icon
def icon(fg="text", bg="dark", fontsize=16, text="?"):
    return widget.TextBox(**base(fg, bg), fontsize=fontsize, text=text, padding=3)


# powerline style icons
def powerline(fg="light", bg="dark"):
    return widget.TextBox(
        **base(fg, bg), text="", fontsize=37, padding=-2  # Icon: nf-oct-triangle_left
    )


def workspaces():
    return [
        separator(),
        widget.GroupBox(
            **base(fg="light"),
            font="UbuntuMono Nerd Font",
            fontsize=19,
            margin_y=3,
            margin_x=0,
            padding_y=8,
            padding_x=1,
            borderwidth=1,
            active=colors["active"],
            inactive=colors["inactive"],
            rounded=False,
            highlight_method="block",
            urgent_alert_method="block",
            urgent_border=colors["urgent"],
            this_current_screen_border=colors["focus"],
            this_screen_border=colors["grey"],
            other_current_screen_border=colors["dark"],
            other_screen_border=colors["dark"],
            disable_drag=True,
        ),
        separator(),
        widget.WindowName(**base(fg="focus"), fontsize=16, padding=5),
        separator(),
    ]


primary_widgets = [
    *workspaces(),
    separator(),
    icon(bg="color4", text=" "),  # Icon: nf-fa-download
    widget.CheckUpdates(
        background=colors["color4"],
        colour_have_updates=colors["text"],
        colour_no_updates=colors["text"],
        no_update_string="0",
        display_format="{updates}",
        update_interval=1800,
        custom_command="checkupdates",
    ),
    separator(),
    icon(bg="color1", text="󰕾 "),
    widget.Volume(
        **base(bg="color1"),
        padding=5,
    ),
    separator(),
    icon(bg="color3", text="󰻠 "),
    widget.Memory(
        **base(bg="color3"),
        measure_mem="G",
        update_interval=5,
        format="Mem:{MemUsed: .2f}{mm}",
    ),
    separator(),
    icon(bg="color3", text="󰻠 "),
    widget.CPU(
        **base(bg="color3"),
        update_interval=5,
        format="CPU: {freq_current}GHz {load_percent}%",
    ),
    separator(),
    icon(bg="color3", text=" "),  # Icon: nf-fa-feed
    widget.Net(
        **base(bg="color3"),
        interface="wlan0",
        format="{interface} ↓↑ {down}",
    ),
    separator(),
    widget.CurrentLayoutIcon(**base(bg="color2"), scale=0.65),
    widget.CurrentLayout(**base(bg="color2"), padding=5),
    separator(),
    icon(bg="color6", fontsize=17, text=" "),  # Icon: nf-mdi-calendar_clock
    widget.Clock(**base(bg="color6"), format="%H:%M - %d/%m/%Y "),
    # separator(),
    # widget.Systray(background="color6"),
]

secondary_widgets = [
    *workspaces(),
    separator(),
    powerline("color1", "dark"),
    widget.CurrentLayoutIcon(**base(bg="color1"), scale=0.65),
    widget.CurrentLayout(**base(bg="color1"), padding=5),
    powerline("color2", "color1"),
    widget.Clock(**base(bg="color2"), format="%d/%m/%Y - %H:%M "),
    powerline("dark", "color2"),
]

widget_defaults = {
    "font": "UbuntuMono Nerd Font Bold",
    "fontsize": 16,
    "padding": 1,
}
extension_defaults = widget_defaults.copy()
