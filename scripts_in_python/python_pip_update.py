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
    "uv",
    "ruff",
    "rich",
    "pyarrow",
    "pip",
    "ipython",
    "polars",
    "pandas",
    "tqdm",
    "numpy",
    "pydantic",
    "requests",
    "fastapi",
    "uvicorn",
]

# -----------------------------------------------
# FUNCTIONS
# -----------------------------------------------


def pip_update(all_libraries=False):
    libraries_to_update = [] if all_libraries else LIBRARIES_TO_UPDATE
    # if all_libraries:
    #     libraries_to_update = []
    # else:
    #     libraries_to_update = LIBRARIES_TO_UPDATE

    # Get the list of outdated libraries
    outdated_libraries = subprocess.run(
        ["uv", "pip", "list", "--outdated"],
        capture_output=True,
        text=True,
    ).stdout.split("\n")[2:]

    for line in outdated_libraries:
        if line.strip():
            library, _, _, _ = line.split()
            if all_libraries or library in libraries_to_update:
                dm("INFO", f"Updating {library}...")
                subprocess.run(
                    ["uv", "pip", "install", "-U", library], stdout=subprocess.PIPE
                )


# -----------------------------------------------
# MAIN
# -----------------------------------------------

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Update Python libraries.")
    parser.add_argument("--all", action="store_true", help="Update all libraries")
    args = parser.parse_args()

    pip_update(args.all)
