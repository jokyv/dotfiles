#!/bin/bash

# all in one bash function
# git stash, git pull, git add, git commit, git push
# check if any file big size
main() {
  FILE_SIZE=50
  # git stash local repo and git pull
  echo "...git pull and git stash apply"
  git stash --include-untracked
  git pull -q
  git stash apply -q
  echo "...checking if any file above $FILE_SIZE MB exist"
  # get the path to the git folder
  DIR_PATH=$(git rev-parse --show-toplevel)
  # check if big files exist before committing
  BIG_FILE="$(fd -H . "$DIR_PATH" --size +"$FILE_SIZE"MB | wc -l)"
  if [ "$BIG_FILE" -gt 0 ]; then
    echo ""
    echo "::WARNING file(s) bigger than $FILE_SIZE MB exist..."
    echo "::delete or ignore the below file(s)"
    fd -H . "$DIR_PATH" --size +"$FILE_SIZE"MB
    return
  fi
  echo "...no big files found"
  echo "...proceeding with git add, commit and push"
  # git add everything
  git add -A
  # commit change with message $1 but be quiet 
  git commit -q -m "$1"
  # git push quiet mode
  git push -q 
  # check git status
  echo "...below is the current git status of the repo"
  git status -sb
}

main
