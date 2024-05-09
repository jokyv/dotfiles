#!/usr/bin/env python

# -----------------------------------------------
# LIBRARIES
# -----------------------------------------------

import argparse
import os
import subprocess

# -----------------------------------------------
# VARIABLES
# -----------------------------------------------


# -----------------------------------------------
# FUNCTIONS
# -----------------------------------------------


def fzf_file_that_contains_phrase(phrase):
    rg_process = subprocess.Popen(["rg", phrase, "-l"], stdout=subprocess.PIPE)
    fzf_process = subprocess.Popen(
        ["fzf", "--preview", "bat --style=numbers --color=always {}"],
        stdin=rg_process.stdout,
        stdout=subprocess.PIPE,
    )
    rg_process.stdout.close()
    selected_file, _ = fzf_process.communicate()
    if selected_file:
        selected_file = selected_file.decode().strip()
        subprocess.run([os.environ.get("EDITOR", "vi"), selected_file])


def fzf_find_big_files(file_size):
    fd_process = subprocess.Popen(
        ["fd", "-H", ".", os.environ["HOME"], "--size", "+" + file_size],
        stdout=subprocess.PIPE,
    )
    fzf_process = subprocess.Popen(
        ["fzf"], stdin=fd_process.stdout, stdout=subprocess.PIPE
    )
    fd_process.stdout.close()
    selected_file, _ = fzf_process.communicate()
    if selected_file:
        print(selected_file.decode().strip())


def fzf_empty_files():
    fd_process = subprocess.Popen(
        ["fd", "-te", "-H", ".", os.environ["HOME"]], stdout=subprocess.PIPE
    )
    fzf_process = subprocess.Popen(
        ["fzf"], stdin=fd_process.stdout, stdout=subprocess.PIPE
    )
    fd_process.stdout.close()
    selected_file, _ = fzf_process.communicate()
    if selected_file:
        print(selected_file.decode().strip())


def fzf_go_to_path():
    fd_process = subprocess.Popen(
        ["fd", "-td", "-H", "-i", ".", os.environ["HOME"]], stdout=subprocess.PIPE
    )
    fzf_process = subprocess.Popen(
        ["fzf"], stdin=fd_process.stdout, stdout=subprocess.PIPE
    )
    fd_process.stdout.close()
    selected_path, _ = fzf_process.communicate()
    if selected_path:
        selected_path = selected_path.decode().strip()
        os.chdir(selected_path)
        subprocess.run(
            [
                "eza",
                "--color=always",
                "--icons=always",
                "--long",
                "--all",
                "--group-directories-first",
                "--git",
            ]
        )


def fzf_copy_to_path():
    fd_output = subprocess.run(
        ["fd", "-tf", "-H", "-i", ".", os.environ["HOME"]],
        capture_output=True,
        text=True,
    )
    source_file = subprocess.run(
        ["fzf"], input=fd_output.stdout, capture_output=True, text=True
    ).stdout.strip()
    destination_directory = subprocess.run(
        ["fd", "-td", "-H", ".", os.environ["HOME"]], capture_output=True, text=True
    )
    if destination_directory.stdout:
        destination_directory = subprocess.run(
            ["fzf"], input=destination_directory.stdout, capture_output=True, text=True
        ).stdout.strip()
        if destination_directory:
            subprocess.run(["cp", "-iv", source_file, destination_directory])


def fzf_open_file():
    fd_output = subprocess.run(
        ["fd", "-tf", "-H", "-i", ".", os.environ["HOME"]],
        capture_output=True,
        text=True,
    )
    selected_file = subprocess.run(
        ["fzf", "--preview", "bat --style=numbers --color=always {}"],
        input=fd_output.stdout,
        capture_output=True,
        text=True,
    ).stdout.strip()
    if selected_file:
        subprocess.run(["hx", selected_file])


def fzf_find_my_scripts():
    fd_output = subprocess.run(
        ["fd", "-tf", ".", os.environ["HOME"] + "/dot/scripts/"],
        capture_output=True,
        text=True,
    )
    selected_script = subprocess.run(
        ["fzf", "--preview", "bat --style=numbers --color=always {}"],
        input=fd_output.stdout,
        capture_output=True,
        text=True,
    ).stdout.strip()
    if selected_script:
        subprocess.run(["hx", selected_script])


def fzf_restore_file_from_trash():
    trash_output = subprocess.run(["trash", "list"], capture_output=True, text=True)
    selected_files = subprocess.run(
        ["fzf", "--multi"], input=trash_output.stdout, capture_output=True, text=True
    ).stdout.strip()
    if selected_files:
        selected_files = selected_files.split("\n")
        selected_files = [file.split()[-1] for file in selected_files]
        for file in selected_files:
            subprocess.run(["trash", "restore", "--match=exact", "--force", file])


def fzf_empty_file_from_trash():
    trash_output = subprocess.run(["trash", "list"], capture_output=True, text=True)
    selected_files = subprocess.run(
        ["fzf", "--multi"], input=trash_output.stdout, capture_output=True, text=True
    ).stdout.strip()
    if selected_files:
        selected_files = selected_files.split("\n")
        selected_files = [file.split()[-1] for file in selected_files]
        for file in selected_files:
            subprocess.run(["trash", "empty", "--match=exact", "--force", file])


# -----------------------------------------------
# MAIN
# -----------------------------------------------

if __name__ == "__main__":
    parser = argparse.ArgumentParser(
        prog="FZF Utility", description="Utility CLI for FZF custom commands"
    )

    parser.add_argument("-fp", "--file_phrase", action="store_true")
    parser.add_argument("-bf", "--big_files", action="store_true")
    parser.add_argument("-ef", "--empty_files", action="store_true")
    parser.add_argument("-gp", "--go_to_path", action="store_true")

    parser.add_argument("-cf", "--copy_file", action="store_true")
    parser.add_argument("-of", "--open_file", action="store_true")
    parser.add_argument("-fs", "--find_scripts", action="store_true")
    parser.add_argument("-rf", "--restore_file", action="store_true")
    parser.add_argument("-et", "--empty_trash", action="store_true")

    args = parser.parse_args()

    if args.file_phrase:
        phrase = input("Enter the phrase to search: ")
        fzf_file_that_contains_phrase(phrase)
    elif args.big_files:
        file_size = input("Enter the file size in MB: ")
        fzf_find_big_files(file_size)
    elif args.empty_files:
        fzf_empty_files()
    elif args.go_to_path:
        fzf_go_to_path()
    elif args.copy_file:
        fzf_copy_to_path()
    elif args.open_file:
        fzf_open_file()
    elif args.find_scripts:
        fzf_find_my_scripts()
    elif args.restore_file:
        fzf_restore_file_from_trash()
    elif args.empty_trash:
        fzf_empty_file_from_trash()
    else:
        print("Command was NOT found")
