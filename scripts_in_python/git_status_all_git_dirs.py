#!/usr/bin/env python

# -----------------------------------------------
# LIBRARIES
# -----------------------------------------------

import os
import subprocess

from messaging import display_message as dm
from rich.console import Console

# -----------------------------------------------
# VARIABLES
# -----------------------------------------------

EXCLUDED_DIRS = ["-E", ".cache", "-E", ".local/share", "-E", "cargo"]
console = Console()

# -----------------------------------------------
# FUNCTIONS
# -----------------------------------------------


def status_all_git_dirs() -> None:
    # Change to the home directory
    os.chdir(os.path.expanduser("~"))

    # Use fd to find directories with .git
    # but exclude dirs with names .cache, .local/share, or cargo
    git_dirs = subprocess.run(
        ["fd", "-td", "-HI", "-g", ".git", *EXCLUDED_DIRS],
        capture_output=True,
        text=True,
    ).stdout.splitlines()

    # Iterate through found git directories
    for git_dir in git_dirs:
        os.chdir(git_dir)
        # Move up one directory level
        os.chdir("..")
        git_status_process = subprocess.run(
            ["git", "status", "-s"], capture_output=True, text=True
        )
        git_status = len(git_status_process.stdout.splitlines())
        if git_status > 0:
            console.print("")
            dm("WARNING", f"{git_dir} repo needs a git commit")
            subprocess.run(["git", "status", "-sb"])
        # return to HOME
        os.chdir(os.path.expanduser("~"))


# -----------------------------------------------
# MAIN
# -----------------------------------------------


if __name__ == "__main__":
    status_all_git_dirs()
