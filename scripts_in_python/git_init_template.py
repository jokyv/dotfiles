#!/usr/bin/env python

# -----------------------------------------------
# Libraries
# -----------------------------------------------

import os

# -----------------------------------------------
# Functions
# -----------------------------------------------


def init_template() -> None:
    """
    Function that creates a git repo and .gitignore file.

    The script will first check if a .git exist.
    If it does will through an error.
    If it does not then will create a git repo
    Then it will create a .gitignore file with basic exceptions
    Finally will git add and git commit an initial commit

    """
    try:
        # Check if a Git repository already exists
        if os.path.exists(".git"):
            raise FileExistsError("Git repository already exists in this directory.")

        # Initialize Git repository
        os.system("git init")

        # Create .gitignore file
        with open(".gitignore", "w") as f:
            f.write("*.csv\n*.pkl\n*.xlsx\n*.txt\n__pycache__\n")

        # Add .gitignore to staging area
        os.system("git add .gitignore")

        # Commit changes
        os.system('git commit -m "git init and git add - basic git ignore file"')

    except FileExistsError as e:
        print(f"Error: {e}")


# -----------------------------------------------
# MAIN
# -----------------------------------------------


if __name__ == "__main__":
    init_template()
