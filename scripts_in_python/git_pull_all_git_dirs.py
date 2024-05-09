#!/usr/bin/env python

# -----------------------------------------------
# lIBRARIES
# -----------------------------------------------

import os
import subprocess

from messaging import display_message as dm
from rich.console import Console

# -----------------------------------------------
# vARIABLES
# -----------------------------------------------

HOME = os.path.expanduser("~")
EXCLUDE_DIRS = ["-gE", ".local/share", "-gE", "helix/", "-gE", ".pyenv"]

# -----------------------------------------------
# fUNCTIONS
# -----------------------------------------------


def pull_all_git_dirs() -> None:
    """
    Function git pull all dirs that have git directories.

    The function first will move to HOME dir.
    Using fd will find all folders that have git directory.
    Iterate through git directories executing git pull in async mode.
    """
    # init console
    console = Console()

    # Change to the home directory
    os.chdir(HOME)

    # Use fd to find directories with .git
    # but exclude dirs with names nvim or .local/share
    git_dirs = subprocess.run(
        ["fd", "-td", "-HI", "-g", ".git", *EXCLUDE_DIRS],
        capture_output=True,
        text=True,
    ).stdout.splitlines()

    # Iterate through found git directories
    for git_dir in git_dirs:
        console.print("")
        console.rule("[bold red]Checking repo")

        os.chdir(f"{HOME}/{git_dir}")
        # Move up one directory level
        os.chdir("..")

        dm("CHECKING", f"Anything to pull for repo: {git_dir}")
        subprocess.run(["git", "pull"])


# -----------------------------------------------
# mAIN
# -----------------------------------------------

if __name__ == "__main__":
    pull_all_git_dirs()
