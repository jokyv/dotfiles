#!/usr/bin/env python

# -----------------------------------------------
# LIBRARIES
# -----------------------------------------------

import subprocess

from messaging import display_message as dm

# -----------------------------------------------
# VARIABLES
# -----------------------------------------------

FILE_SIZE_LIMIT = 50  # MB

# -----------------------------------------------
# FUNCTIONS
# -----------------------------------------------


def git_commit_workflow(commit_message):
    # Git stash, pull, and apply
    print("...git pull and git stash apply")
    subprocess.run(["git", "stash", "--include-untracked"])
    subprocess.run(["git", "pull", "-q"])
    subprocess.run(["git", "stash", "apply", "-q"])

    print(f"...checking if any file above {FILE_SIZE_LIMIT} MB exist")
    # Get the path to the git folder
    dir_path = subprocess.run(
        ["git", "rev-parse", "--show-toplevel"], capture_output=True, text=True
    ).stdout.strip()

    # Check if big files exist before committing
    big_files = subprocess.run(
        ["fd", "-H", ".", dir_path, "--size", f"+{FILE_SIZE_LIMIT}MB"],
        capture_output=True,
        text=True,
    ).stdout.splitlines()
    if big_files:
        dm("WARNING", "file(s) bigger than 50MB exist..")
        dm("WARNING", "delete or ignore the below file(s):")
        for file in big_files:
            print(file)
        return

    dm("INFO", "...no big files found")
    dm("INFO", "...proceeding with git add, commit, and push")

    # Git add everything
    subprocess.run(["git", "add", "-A"])
    # Commit change with commit_message but be quiet
    subprocess.run(["git", "commit", "-q", "-m", commit_message])
    # Git push in quiet mode
    subprocess.run(["git", "push", "-q"])

    # Check git status
    print("...below is the current git status of the repo")
    subprocess.run(["git", "status", "-sb"])


# -----------------------------------------------
# MAIN
# -----------------------------------------------


def main() -> None:
    commit_message = input("Enter commit message: ")
    git_commit_workflow(commit_message)


if __name__ == "__main__":
    main()
