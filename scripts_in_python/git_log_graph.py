#!/usr/bin/env python

# -----------------------------------------------
# LIBRARIES
# -----------------------------------------------

import subprocess

# -----------------------------------------------
# FUNCTIONS
# -----------------------------------------------


def log_graph() -> None:
    git_log_command = [
        "git",
        "log",
        "--graph",
        "--abbrev-commit",
        "--decorate",
        "--format=format:%C(bold green)%h%C(reset) - %C(bold cyan)%aD%C(reset) %C(bold yellow)(%ar)%C(reset)%C(auto)%d%C(reset)%n%C(white)%s%C(reset) %C(dim white)- %an%C(reset)",
        "--all",
    ]
    subprocess.run(git_log_command)


# -----------------------------------------------
# MAIN
# -----------------------------------------------


if __name__ == "__main__":
    log_graph()
