#!/usr/bin/env python

# -----------------------------------------------
# LIBRARIES
# -----------------------------------------------

import os
import subprocess

from rich.console import Console
from rich.prompt import Prompt

# -----------------------------------------------
# VARIABLES
# -----------------------------------------------

HOME_DIR = os.path.expanduser("~")
console = Console()

# -----------------------------------------------
# FUNCTIONS
# -----------------------------------------------


def ask(question):
    response = Prompt.ask(
        console.render_str(f"{question} ([bold yellow]yes[/bold yellow]/no) ")
    )
    if not response:
        return True  # Return True for empty input (default to Yes)
    return response.lower().startswith("y")


def os_update():
    console.rule(":: ----- PACMAN UPDATE ------")
    if ask("Do you want to update OS?"):
        subprocess.run(["sudo", "pacman", "-Syu"])
        subprocess.run(["paru", "-Syu"])


def git_status_all_git_dirs():
    console.rule(":: ----- GIT STATUS ALL -----")
    if ask("Do you want to update git repos?"):
        # Implement logic to show git status
        # for all directories containing Git repositories
        pass


def git_push_all():
    console.rule(":: ------ GIT PUSH ALL ------")
    if ask("DO you want to git push all repos?"):
        # Implement logic to push changes for all Git repositories
        pass


def update_wallpaper():
    console.rule(":: ---- UPDATE WALLPAPER ----")
    if ask("Do you want to update wallpaper repo?"):
        console.print("Change wallpaper at least once a week :warning:")
        wallpapers_dir = f"{HOME_DIR}/pics/wallpapers/"
        wallpapers = subprocess.run(
            ["shuf", "-n", "1", "-e", f"{wallpapers_dir}*"],
            capture_output=True,
            text=True,
        ).stdout.strip()
        subprocess.run(["feh", "--bg-fill", wallpapers])


def clean_os():
    console.rule(":: -------- CLEAN OS --------")
    if ask("Do you want to clean your OS?"):
        subprocess.run(["sudo", "pacman", "-Sc"])
        subprocess.run(["paru", "-Sc"])


def remove_orphans():
    console.rule(":: ----- Remove Orphans -----")
    if ask("Do you want to remove Orphans?"):
        console.print("The following are orphan programs defined by pacman:")
        console.print('This was run using: "sudo pacman -Qdt"')
        subprocess.run(["sudo", "pacman", "-Qdt"])
        console.print("")
        console.print("The following are paru defined orphan programs:")
        subprocess.run(["paru", "-Qdt"])


def python_packages_update():
    console.rule(":: - Python Packages Update -")
    if ask("Do you want to update Python Packages?"):
        # Replace with your logic to update Python packages
        pass


def check_system():
    console.rule(":: ------ CHECK SYSTEM ------")
    if ask("Do you want to check system?"):
        console.print(":: Check if any system failures")
        subprocess.run(["systemctl", "--failed"])

        console.print("")
        console.print(":: Check how big is your cache")
        console.print(":: Remove with rm -rf .cache/*")
        os.chdir(f"{HOME_DIR}/.cache/")
        subprocess.run(
            [
                "erd",
                "--layout",
                "flat",
                "--disk-usage",
                "block",
                "--no-ignore",
                "--hidden",
                "--level",
                "1",
                "--sort",
                "size",
            ]
        )

        console.print("")
        console.print(":: Check how big is your journal")
        console.print(":: Remove with sudo journalctl --vacuum-time=2weeks")
        os.chdir("/var/log/journal")
        subprocess.run(
            [
                "erd",
                "--layout",
                "flat",
                "--disk-usage",
                "block",
                "--no-ignore",
                "--hidden",
                "--level",
                "1",
                "--sort",
                "size",
            ]
        )


def rust_update():
    console.rule(":: ------ RUST UPDATE -------")
    if ask("Do you want to update rust?"):
        console.print("updating rustup...")
        subprocess.run(["rustup", "update"])

        console.print("updating all apps installed with cargo")
        subprocess.run(["cargo", "install-update", "-l"])
        subprocess.run(["cargo", "install-update", "-a", "-q"])

        console.print("removing cache that we dont need from cargo")
        subprocess.run(["cargo", "cache", "-a"])


def weekly_git_commits():
    console.rule(":: --- WEEKLY GIT COMMITS ---")
    if ask("Do you want to perform weekly git commits?"):
        git_auto_commit("~/pics/wallpapers/")
        git_auto_commit("~/projects/notes/")


def git_auto_commit(path):
    # Implement logic to perform git auto-commit for the given path
    pass


# -----------------------------------------------
# MAIN
# -----------------------------------------------


def main() -> None:
    os_update()
    git_status_all_git_dirs()
    git_push_all()
    update_wallpaper()
    clean_os()
    remove_orphans()
    python_packages_update()
    check_system()
    rust_update()
    weekly_git_commits()


if __name__ == "__main__":
    main()
