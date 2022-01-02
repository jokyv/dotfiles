#!/bin/bash

main() {
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

main
