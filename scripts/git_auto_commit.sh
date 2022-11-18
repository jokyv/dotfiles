#!/bin/bash

# Variables
# ----------------------------------------------------------------------------
PATHS=(
  "$HOME/projects/notes/"
  )

# Helper function that auto git commis
# ----------------------------------------------------------------------------
git_auto_commit() {
    cd "$1"
    git pull

    CHANGES_EXIST="$(git status --porcelain | wc -l)"

    echo ":: Checking for repo {$1}"

    # if no changes then exit with code 0
    if [ "$CHANGES_EXIST" -eq 0 ]; then
      echo ":: Nothing to commit moving on..."
    else
      git add .
      git commit -q -m "auto update at: $(date +"%d-%m-%Y %H:%M:%S")"
      git push -q
      echo ":: Found changes! git add, commit push performed"
    fi
}

# Main
# ----------------------------------------------------------------------------
main() {
  for path in ${PATHS[@]}
  do 
    git_auto_commit $path
  done
}

main