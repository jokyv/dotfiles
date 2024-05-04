#!/usr/bin/env python

# -----------------------------------------------
# LIBRARIES
# -----------------------------------------------

import os
import subprocess

# -----------------------------------------------
# VARIABLES
# -----------------------------------------------

HOME = os.path.expanduser("~")
EXCLUDE_DIRS = ["-gE", "helix/"]

# -----------------------------------------------
# FUNCTIONS
# -----------------------------------------------


def main() -> None:
    """
    Function git push all dirs that have git dir in projects folder.

    The Function first will move to projects dir.
    Using fd will find all git folders in the project dir.
    Then it will iterate through them executing a git push
    with an auto generated message.
    """
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
        print(f"git push for {git_dir}")
        print()
        # Run git add, commit and push
        commit_message = "This is an auto generated git commit!"
        subprocess.run(["git", "add", "."])
        subprocess.run(["git", "commit", "-qm", commit_message])
        subprocess.run(["git", "pull", "-q"])


# -----------------------------------------------
# MAIN
# -----------------------------------------------


if __name__ == "__main__":
    main()
