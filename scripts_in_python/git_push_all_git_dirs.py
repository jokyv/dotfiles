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

HOME = os.path.expanduser("~")
EXCLUDE_DIRS = ["-gE", "helix/"]

# -----------------------------------------------
# FUNCTIONS
# -----------------------------------------------


def push_all_git_dirs() -> None:
    """
    Function git push all dirs that have git dir in projects folder.

    The Function first will move to projects dir.
    Using fd will find all git folders in the project dir.
    Then it will iterate through them executing a git push
    with an auto generated message.
    """
    # init rich.console
    console = Console()
    # Change to the project directory
    os.chdir(f"{HOME}/projects")

    # Use fd to find directories with .git
    # but exclude dirs as defined by exclude_dirs variable
    git_dirs = subprocess.run(
        ["fd", "-td", "-HI", "-g", ".git", *EXCLUDE_DIRS],
        capture_output=True,
        text=True,
    ).stdout.splitlines()

    # Iterate through found git directories
    for git_dir in git_dirs:
        os.chdir(f"{HOME}/projects/{git_dir}")

        # Move up one directory level
        os.chdir("..")
        git_status_process = subprocess.run(
            ["git", "status", "-s"], capture_output=True, text=True
        )
        git_status = len(git_status_process.stdout.splitlines())

        if git_status > 0:
            # messaging
            console.print("")
            dm("WARNING", f"{git_dir} repo needs a git commit")

            # Run git add, commit and push
            commit_message = "This is an auto generated git commit!"
            subprocess.run(["git", "add", "."])
            subprocess.run(["git", "commit", "-qm", commit_message])
            subprocess.run(["git", "push", "-q"])
            dm("SUCCESS", "git auto commit was pushed!")


# -----------------------------------------------
# MAIN
# -----------------------------------------------


if __name__ == "__main__":
    push_all_git_dirs()
