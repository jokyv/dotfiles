#!/usr/bin/env python3

# -----------------------------------------------
# LIBRARIES
# -----------------------------------------------

import argparse
import subprocess

from messaging import display_message as dm

# -----------------------------------------------
# VARIABLES
# -----------------------------------------------

LIBRARIES_TO_UPDATE = [
    "fastapi",
    "hvplot",
    "ipython",
    "mypy",
    "numpy",
    "pandas",
    "panel",
    "pip",
    "polars",
    "pyarrow",
    "pydantic",
    "python-lsp-server",
    "requests",
    "rich",
    "ruff",
    "tqdm",
    "uv",
    "uvicorn",
]

# -----------------------------------------------
# FUNCTIONS
# -----------------------------------------------


def pip_update_selected_libraries():
    for library in LIBRARIES_TO_UPDATE:
        dm("CHECKING", f"{library}")
        subprocess.run(["uv", "pip", "install", "-U", library], stdout=subprocess.PIPE)


def pip_update_all_libraries():
    # Get the list of all libraries
    all_libraries = subprocess.run(
        ["uv", "pip", "list"],
        capture_output=True,
        text=True,
    ).stdout

    lines = all_libraries.strip().split("\n")
    package_names = []

    # Skip the first two lines (headers and separator)
    for line in lines[2:]:
        package, _ = line.rsplit(maxsplit=1)
        package_names.append(package.strip())

    for library in package_names:
        dm("CHECKING", f"{library}")
        subprocess.run(["uv", "pip", "install", "-U", library], stdout=subprocess.PIPE)


# -----------------------------------------------
# MAIN
# -----------------------------------------------

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Update Python libraries.")
    parser.add_argument("-A", "--all", action="store_true", help="Update all libraries")
    parser.add_argument(
        "-S", "--selected", action="store_true", help="Update all libraries"
    )
    args = parser.parse_args()

    if args.all:
        pip_update_all_libraries()
    elif args.selected:
        pip_update_selected_libraries()
