#!/usr/bin/env python3

import readline
import subprocess


def s(*args):
    if len(args) == 0:
        # Get the last command from history
        last_command = readline.get_history_item(readline.get_current_history_length())
        if last_command:
            subprocess.run(["sudo"] + last_command.split())
        else:
            print("No previous command found in history.")
    else:
        subprocess.run(["sudo"] + list(args))


# -----------------------------------------------
# MAIN
# -----------------------------------------------

if __name__ == "__main__":
    # Uncomment the line below to test the function with an actual command
    # s('ls', '-l')  # Example with arguments
    s()  # Example without arguments (last command in history)
