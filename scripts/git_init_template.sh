#!/bin/bash

# a git init template when i start a new git project
main() {
  git init
  touch .gitignore
  echo -e "*.csv\n*.pkl\n*.xlsx\n*.txt\n__pycache__" > .gitignore
  git add .gitignore
  git commit -m "git init and add basic git ignore file"
}

main
