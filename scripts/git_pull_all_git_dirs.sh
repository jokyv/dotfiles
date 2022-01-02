#!/bin/bash

# a simple for loop that searches git directories and 
# execute a git pull for each one
main() {
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

main
