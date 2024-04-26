#!/usr/bin/env python

# -----------------------------------------------
# lIBRARIES
# -----------------------------------------------

import os
import subprocess

# -----------------------------------------------
# vARIABLES
# -----------------------------------------------

HOME = os.path.expanduser("~")
EXCLUDE_DIRS = ["-gE", ".local/share", "-gE", "helix/"]

# -----------------------------------------------
# fUNCTIONS
# -----------------------------------------------


def git_pull_all_git_dirs() -> None:
    """
    Function git pull all dirs that have git directories.

    The function first will move to HOME dir.
    Using fd find all folders that have git directory.
    Iterate through git directories executing git pull in async mode.
    """
    # Change to the home directory
    os.chdir(os.path.expanduser("~"))

    # Use fd to find directories with .git
    # but exclude dirs with names nvim or .local/share
    git_dirs = subprocess.run(
        ["fd", "-td", "-HI", "-g", ".git", *EXCLUDE_DIRS],
        capture_output=True,
        text=True,
    ).stdout.splitlines()

    # Iterate through found git directories
    for git_dir in git_dirs:
        os.chdir(f"{HOME}/{git_dir}")
        # Move up one directory level
        os.chdir("..")
        print(f"git pull for {git_dir}")
        # Run git pull command in quiet mode
        subprocess.run(["git", "pull", "-q"])


# -----------------------------------------------
# mAIN
# -----------------------------------------------


def main() -> None:
    git_pull_all_git_dirs()


if __name__ == "__main__":
    main()
