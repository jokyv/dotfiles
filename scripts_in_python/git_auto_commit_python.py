#!/usr/bin/env python

# -----------------------------------------------
# LIBRARIES
# -----------------------------------------------

import os
import subprocess
from datetime import datetime

from rich.console import Console

# -----------------------------------------------
# VARIABLES
# -----------------------------------------------

HOME_DIR = os.path.expanduser("~")
PATHS = [f"{HOME_DIR}/projects/notes/", f"{HOME_DIR}/pics/wallpapers"]

# -----------------------------------------------
# FUNCTIONS
# -----------------------------------------------


def git_auto_commit(paths: list[str]) -> None:
    """
    Function that automatically git commit and push repo list.

    Parameters
    ----------
    paths : list[str]
        list of paths with repos to check, commit and push

    """
    console = Console()

    for path in paths:
        console.rule("[bold red]Checking repo")
        if not os.path.exists(path):
            console.print(
                f"[bold red]:: Error![/bold red] Path: '{path}' does not exist."
            )
            continue

        subprocess.run(["git", "pull"], cwd=path)

        console.print(f":: Checking for repo {path}")

        # Run git status to check for changes
        git_status_process = subprocess.run(
            ["git", "status", "--porcelain"], capture_output=True, cwd=path, text=True
        )
        changes_exist = len(git_status_process.stdout.splitlines())

        # if no changes then exit with code 0
        if changes_exist == 0:
            console.print("[bold green]:: Nothing to commit,[/bold green] moving on...")
            console.print("")
        else:
            subprocess.run(["git", "add", "."], cwd=path)
            commit_message = (
                f"auto update at: {datetime.now().strftime('%d-%m-%Y %H:%M:%S')}"
            )
            subprocess.run(["git", "commit", "-q", "-m", commit_message], cwd=path)
            subprocess.run(["git", "push", "-q"], cwd=path)
            console.print("[bold green]:: Found changes![/bold green]")
            console.print("'git add', 'git commit', 'git push' performed")
            console.print("")


# -----------------------------------------------
# MAIN
# -----------------------------------------------

if __name__ == "__main__":
    git_auto_commit(PATHS)
