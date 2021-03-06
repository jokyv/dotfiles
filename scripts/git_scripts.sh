#!/bin/bash

# a git init template when i start a new git project
git_init_template() {
  git init
  touch .gitignore
  echo -e "*.csv\n*.pkl\n*.xlsx\n*.txt\n__pycache__" > .gitignore
  git add .gitignore
  git commit -m "git init and add basic git ignore file"
}

# a simple for loop that searches git directories and 
# execute a git pull for each one
git_pull_all_git_dirs() {
  cd
  pids=""
  for file in $(fd -td -H '^.git$' -E 'nvim')
  do
    cd $file
    cd ..
    # echo ""
    echo "git pull for $file"
    # run it as subprocess - like bash async
    git pull -q &
    pids="$pids $!"
    cd
  done

  wait $pids
}

git_status_all_git_dirs() {
  cd
  for file in $(fd -td -H '^.git$' -E '.cargo')
  do
    cd $file
    cd ..
    git_status=$(git status -s | wc -l)
    if [ $git_status -gt 0 ]
      then
        echo ""
        echo "## $file repo needs a git commit"
        git status -sb
    fi
    cd
  done
}

# all in one bash function
# git stash, git pull, git add, git commit, git push
# check if any file big size
git_commit_workflow() {
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

git_log_graph() {
  git log --graph --abbrev-commit --decorate --format=format:'%C(bold green)%h%C(reset) - %C(bold cyan)%aD%C(reset) 
%C(bold yellow)(%ar)%C(reset)%C(auto)%d%C(reset)%n''%C(white)%s%C(reset) %C(dim white)- %an%C(reset)' --all
}
