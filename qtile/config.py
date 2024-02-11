# Qtile Config File
# http://www.qtile.org/

import os
import subprocess

from libqtile import hook

from settings.groups import groups  # noqa: F401
from settings.keys import keys, mod  # noqa: F401
from settings.layouts import floating_layout, layouts  # noqa: F401
from settings.mouse import mouse  # noqa: F401
from settings.screens import screens  # noqa: F401
from settings.widgets import extension_defaults, widget_defaults  # noqa: F401


@hook.subscribe.startup_once
def autostart():
    home = os.path.expanduser("~/.config/qtile/autostart.sh")
    subprocess.Popen([home])


main = None
dgroups_key_binder = None
dgroups_app_rules = []
follow_mouse_focus = True
bring_front_click = False
cursor_warp = True
auto_fullscreen = True
focus_on_window_activation = "urgent"
wmname = "QTILE"
