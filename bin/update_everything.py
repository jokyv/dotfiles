#!/usr/bin/env python

# -----------------------------------------------
# LIBRARIES
# -----------------------------------------------

import os
import subprocess
import sys

from git_util import auto_commit, pull_all_git_dirs
from messaging import display_message as dm
from python_pip_update import pip_update_selected_libraries
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
    # beutification
    yes = "[bold yellow]yes[/bold yellow]"
    exit = "[bold red]exit[/bold red]"
    response = Prompt.ask(console.render_str(f"{question} ({yes}/no/{exit}) "))

    if not response:
        return True  # Return True for empty input (default to Yes)
    response = response.lower().strip()
    if response.startswith("y"):
        return True
    elif response.startswith("n"):
        return False
    elif response == "exit":
        console.print("Exiting the script. Goodbye!")
        sys.exit()
    else:
        console.print("Invalid input. Please try again!")


def os_update():
    console.rule("------- PACMAN UPDATE -------")
    if ask("Do you want to update OS?"):
        subprocess.run(["sudo", "pacman", "-Syu"])
        # subprocess.run(["paru", "-Syu"])


def git_status_all_git_dirs():
    console.rule("------ GIT STATUS ALL -------")
    if ask("Do you want to update git repos?"):
        # Implement logic to show git status
        # for all directories containing Git repositories
        pass


def git_pull_all():
    console.rule("------- GIT PULL ALL --------")
    if ask("Do you want to git pull all repos?"):
        pull_all_git_dirs()


def update_wallpaper():
    console.rule("----- UPDATE WALLPAPER ------")
    if ask("Do you want to update wallpaper repo?"):
        dm("INFO", "change wallpaper at least once per week")
        pass
        # wallpapers_dir = f"{HOME_DIR}/pics/wallpapers/*"
        # wallpapers = subprocess.run(
        #     ["shuf", "-n", "1", "-e", wallpapers_dir],
        #     capture_output=True,
        #     text=True,
        # ).stdout.strip()
        # subprocess.run(["swaybg", "-i", wallpapers])


def clean_os():
    console.rule("--------- CLEAN OS ----------")
    if ask("Do you want to clean your OS?"):
        # clean OS
        subprocess.run(["sudo", "pacman", "-Sc"])
        # subprocess.run(["paru", "-Sc"])

        # remove orphans
        dm("INFO", "The following are orphan programs defined by pacman:")
        dm("INFO", "This was run using: 'sudo pacman -Qdt'")
        subprocess.run(["sudo", "pacman", "-Qdt"])
        console.print("")
        # dm("INFO", "The following are paru defined orphan programs:")
        # subprocess.run(["paru", "-Qdt"])


def python_packages_update():
    console.rule("--- Python Packages Update --")
    if ask("Do you want to update Python Packages?"):
        pip_update_selected_libraries()


def check_system():
    console.rule("------- CHECK SYSTEM --------")
    if ask("Do you want to check system?"):
        dm("CHECKING", "if any system failures.")
        subprocess.run(["systemctl", "--failed"])

        console.print("")
        dm("CHECKING", "how big is your cache")
        dm("INFO", "Remove with `rm -rf ~/.cache/*`")
        os.chdir(f"{HOME_DIR}/.cache/")
        subprocess.run(
            [
                "eza",
                "--total-size",
                "--long",
                "--all",
                "--no-permissions",
                "--no-time",
                "--no-user",
                "--sort=size",
            ]
        )

        console.print("")
        dm("CHECKING", "How big is your journal")
        dm("INFO", "Remove with `sudo journalctl --vacuum-time=2weeks`")
        os.chdir("/var/log/journal")
        subprocess.run(
            [
                "eza",
                "--total-size",
                "--long",
                "--all",
                "--no-permissions",
                "--no-time",
                "--no-user",
                "--sort=size",
            ]
        )


# def rust_update():
#     console.rule("-------- RUST UPDATE --------")
#     if ask("Do you want to update rust?"):
#         dm("CHECKING", "rustup updates")
#         subprocess.run(["rustup", "update"])

#         dm("CHECKING", "updates for all apps installed with cargo")
#         subprocess.run(["cargo", "install-update", "-l"])
#         subprocess.run(["cargo", "install-update", "-a", "-q"])

#         dm("INFO", "Removing cache that we dont need from cargo")
#         subprocess.run(["cargo", "cache", "-a"])


def weekly_git_commits():
    console.rule("----- WEEKLY GIT COMMITS ----")
    if ask("Do you want to perform weekly git commits?"):
        paths = [f"{HOME_DIR}/projects/notes/", f"{HOME_DIR}/pics/wallpapers/"]
        auto_commit(paths)


# -----------------------------------------------
# MAIN
# -----------------------------------------------


def main() -> None:
    os_update()
    git_status_all_git_dirs()
    git_pull_all()
    update_wallpaper()
    clean_os()
    python_packages_update()
    check_system()
    # rust_update()
    weekly_git_commits()


if __name__ == "__main__":
    main()
