# Theming for Qtile

import os
import json
from pathlib import Path

THEME = "rosepine"
HOME_PATH = str(Path.home())


def load_theme():
    theme_file = f"{HOME_PATH}/.config/qtile/themes/{THEME}.json"

    if not os.path.isfile(theme_file):
        raise Exception(f'"{theme_file}" does not exist')

    with open(theme_file) as f:
        return json.load(f)


if __name__ == "settings.theme":
    colors = load_theme()
