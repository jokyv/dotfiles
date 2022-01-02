#!/bin/bash

#######################################################################
## HELPER FUNCTIONS
# helper function that auto git commis
auto_git_commit() {
    # MY_PATH="~/projects/notes"
    cd "$1"
    CHANGES_EXIST="$(git status --porcelain | wc -l)"
    # if no changes then exit with code 0
    echo ":: Checking for repo {$1}"
    if [ "$CHANGES_EXIST" -eq 0 ]; then
      echo ":: Nothing to commit moving on..."
    else
      git status -s
      git add .
      git commit -q -m "weekly auto update: $(date +"%Y-%m-%d %H:%M:%S")"
      git push -q
      git status -s
    fi
}

# a helper function when a section is of a script is 'disabled'
work_in_progress() {
  echo ""
  echo 'this section is work in progress'
  echo ""
}

#######################################################################
## SCRIPTS
# a simple script that source .bash_aliases, .bashrc and .profile files
source_files() {
  clear
  echo "-- terminal cleared"
  # sourcing .profile will source .bashrc which will source .aliases
  source ~/.profile
}

# a simple script that combines cd with exa
cd_with_exa() {
  cd "$1" &&
  exa -alh --color=always --sort=ext;
}

# scripl that updates pacman apps and git pull all repos
# for daily morning usage
daily_updates() {
  echo -e '\n==========================' && 
  echo -e '|------ UPGRADE OS ------|' &&
  echo -e '==========================\n' &&
  # upgrade with pacman
  sudo pacman -Syu
  echo -e '\n===========================' &&
  echo -e '|------ GIT PULL ALL -----|' &&
  echo -e '===========================\n' &&
  # pull request from all git repos
  echo "-- do you want to run the 'git pull all' command? [yes/no]"
  read answer
  # reverse inequality
  if [ "$answer" != "${answer#[yesYy]}" ]; then
      echo "...YES 'git pull all' right now!"
      gpulla
  else
      echo "...NO 'git pull all' right now!"
  fi 
}

# =============================================================================
weekly_updates() {
  echo -e '\n==========================' && 
  echo -e '|------ UPGRADE OS ------|' &&
  echo -e '==========================\n' &&
  sudo pacman -Syu
  echo -e '\n===========================' &&
  echo -e '|----- GIT STATUS ALL ----|' &&
  echo -e '===========================\n' &&
  gsa
  echo -e '\n===========================' &&
  echo -e '|------ GIT PUSH ALL -----|' &&
  echo -e '===========================\n' &&
  # TODO: do i need this?
  work_in_progress

  echo -e '\n===========================' &&
  echo -e '|------ WALLPAPERS -----|' &&
  echo -e '===========================\n' &&

  echo -e 'change wallpaper at least ance a week ;)'
  feh --bg-fill $(shuf -n 1 -e ~/pics/wallpapers/*)

  echo -e '\n==========================' && 
  echo -e '|------ NVIM TASKS ------|' &&
  echo -e '==========================' &&
  # echo 'sorting nvim spell file'
  # sort -u $HOME/.config/nvim/spell/en.utf-8.add -o "$HOME/.config/nvim/spell/en.utf-8.add"
  echo "git pull lvim"
  cd ~
  cd $HOME/.local/share/lunarvim/lvim/
  git pull
  lvim +LvimCacheReset +PackerUpdate
  # clean OS
  echo -e '\n==========================' && 
  echo -e '|------- CLEAN OS -------|' &&
  echo -e '==========================' &&
  # TODO: update paru packages first, will update pacman packages also
  paru -Syu
  sudo pacman -Sc
  paru -Sc
  echo -e '\n==========================' && 
  echo -e '|---- Remove Orphans ----|' &&
  echo -e '==========================\n' &&
  echo 'the following are pacman defined orphan programs:'
  echo 'this was run using: "sudo pacman -Qdt"'
  echo 'please remove with sudo pacman -Rns <Program>'
  sudo pacman -Qdt
  echo ''
  echo 'the following are paru defined orphan programs:'
  paru -Qdt
  echo -e '\n==========================' && 
  echo -e '|--- CONDA UPDATE ALL ---|' &&
  echo -e '==========================\n' &&
  # conda update -y conda # updates all conda packages without conflicts (recommended)
  # TODO: replace with pip install-update
  work_in_progress

  # need to install reflector
  # sudo reflector -c Singapore -a 6 --sort rate --save /etc/pacman.d/mirrorlist
  echo -e '\n==========================' && 
  echo -e '|----- CHECK SYSTEM -----|' &&
  echo -e '==========================\n' &&

  echo '::check if any system failures'
  systemctl --failed

  echo ''
  echo '::check how big is your cache'
  echo '::remove with rm -rf .cache/*'
  # du -sh ~/.cache/
  dust -p -n 10 ~/.cache/

  echo ''
  echo '::check how big is your journal'
  echo '::remove with sudo journalctl --vacuum-time=2weeks'
  # du -sh /var/log/journal
  dust -p -n 10 /var/log/journal

  echo -e '\n==========================' && 
  echo -e '|----- CARGO UPDATE -----|' &&
  echo -e '==========================\n' &&
  cargo install-update -l
  cargo install-update -a -q

  echo -e '\n==========================' && 
  echo -e '|-- WEEKLY GIT COMMITS --|' &&
  echo -e '==========================\n' &&

  read -p "Do you want to commit your wallpapers, notes and my_wiki? " yn
    case $yn in
      [Yy]* ) 
        auto_git_commit "$HOME/pics/wallpapers/" &&
        auto_git_commit "$HOME/projects/notes/" &&
        auto_git_commit "$HOME/projects/my_wiki";;
      [Nn]* ) echo "...NO "git commit" right now!";;
      * ) echo "Please answer y or n.";;
    esac
  echo ""
}
