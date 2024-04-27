#!/usr/bin/env python

# -----------------------------------------------
# LIBRARIES
# -----------------------------------------------

import subprocess

# -----------------------------------------------
# FUNCTIONS
# -----------------------------------------------


def main() -> None:
    # Remove the files from the index (not the actual files in the working copy)
    subprocess.run(["git", "rm", "-r", "--cached", "."])
    # Add these removals to the Staging Area...
    subprocess.run(["git", "add", "."])
    # ...and commit them!
    subprocess.run(["git", "commit", "-m", "Clean up ignored files"])
    # finally do a git push
    subprocess.run(["git", "push"])


# -----------------------------------------------
# MAIN
# -----------------------------------------------


if __name__ == "__main__":
    main()
