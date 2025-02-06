# Changelog

All notable changes to this project will be documented in this file.

## [4.3.0] - 2025-02-05

### 󰩉 Features

- _(.aliases)_ Update aliases related to lunix_util.py
- _(.bashrc)_ Add path for personal scripts
- _(.exports)_ Export variable for homebrew
- _(aider)_ Add .env with aider configurations
- _(aider)_ Many updates with the config
- _(aider)_ Updates to .env file
- _(bashrc)_ Add path for the sops key
- _(bin)_ Moved all my scripts to a standalone repo
- _(helix)_ Add `typos` for typo checking to markdown config
- _(helix)_ Change markdown LSP to 'markdown-oxide'
- _(helix)_ Languages config updates
- _(helix)_ Switched to markdown oxide instead of marksman
- _(shell)_ Add .local/bin to path and zoxide
- _(shell)_ Remove z command replaced with zoxide
- _(starship)_ Add `.` to fill gap between panels
- _(yazi)_ Update configs

###  Bug Fixes

- _(README.md)_ Fixed grammar errors
- _(README.md)_ Fixed small typo
- _(README.md)_ Fixed the call out
- _(bash_profile)_ Moved GCP installation to $HOME

### 📚 Documentation

- _(changelog.md)_ Add new changelog for 4.2
- _(README.md)_ Updated current status of usage of repo
- _(aider)_ Added more info into README.md file

## [4.2.0] - 2024-12-19

### 󰩉 Features

- _(.aliases)_ Add more alliases and group commands better
- _(.gitignore)_ Update with new rule
- _(.install)_ Added ufw as potential services to activate when new install
- _(aliases)_ Remove redundant code
- _(bin)_ Add more links to check for git updates
- _(helix)_ Add grammar for more languages
- _(home)_ New formatter and LSP for nix
- _(home)_ New formatter and LSP for nix
- _(home-manager)_ Add more applications managed by hm
- _(home-manager)_ Add more programs
- _(home-manager)_ Add not free apps option
- _(home-manager)_ Add some useful configs for later
- _(home.nix)_ Add more applications
- _(justfile)_ No more debug mode for gc command
- _(kitty)_ Back to previous setup without nix home-manager
- _(kitty)_ Kitty conf managed by home manager now
- _(niri)_ Add spawn at start up the waypaper --restore
- _(niri)_ Add waybar to spawn at startup
- _(nushell)_ Add more configs for nu
- _(nushell)_ Init nushell config
- _(polars)_ Moved it to python folder
- _(python)_ Add more core python libraries to the file
- _(python-dev.nix)_ Add nix shell python environment
- _(shell)_ Add inputrc
- _(stylix)_ Switching icons package
- _(typos)_ Add word
- _(waypaper)_ Add config

###  Bug Fixes

- _(.aliases)_ Remove dupe
- _(aliases)_ Typo
- _(bash)_ Remove tool PATH for uv tools
- _(cargo)_ Remove to source cargo folder

### 📚 Documentation

- _(CHANGELOG.md)_ Add new release notes

## [4.1.0] - 2024-10-12

### 󰩉 Features

- _(.aliases)_ New alias p3 added
- _(.aliases)_ Update home-manager shortcut alias
- _(.bashrc)_ Deactivate function that activates the virtual py env
- _(.exports)_ Fix FZF main command
- _(.exports)_ Update browser variable
- _(.install)_ Added mesa removed nautilus
- _(.install)_ More automated functions to bootstrap system
- _(README.md)_ Update the application list i use
- _(aliases)_ Add small function to run previous command with sudo
- _(aliases)_ Finally having the correct path for home-manager switch anywhere
- _(atuin)_ Change search to fuzzy
- _(bashrc)_ Added Nix path
- _(bin)_ Cleaning scripts
- _(bin)_ Move all bash scripts to /usr/bin/env bash shebang
- _(bin)_ Separating standalone scripts and utilities
- _(bin)_ Update scripts
- _(bravebookmarks.sh)_ Replaced rofi for fuzzel
- _(browser_bookmarks)_ Updated scripts for brave and firefox
- _(dprint)_ Update include files and versions
- _(fd)_ Ignore more directories i dont use
- _(files)_ Fixed a lot of typos
- _(firefox.nix)_ Add more custom settings for firefox
- _(folders)_ Moved files to their own folders
- _(git)_ Update ignore list
- _(helix)_ Add nix formatter
- _(helix)_ Added new shortcuts to close buffers
- _(helix)_ New shortcuts and config cleaning
- _(home manager nix)_ Add modules folder and refactoring
- _(home manager nix)_ Moved to the unstable
- _(home manager nix)_ Update configs
- _(home-manager)_ Add fastfetch.nix
- _(home-manager)_ Add foot.nix configs
- _(home-manager)_ Add more packages to install
- _(home-manager)_ Add second file justfile
- _(home-manager)_ Add yet another package managed by nix hm
- _(home-manager)_ Added firefox.nix with firefox configs
- _(home-manager)_ Added font.nix
- _(home-manager)_ Added fonts into stylix
- _(home-manager)_ Added ly.nix
- _(home-manager)_ Added module foot.nix
- _(home-manager)_ Added zathura.nix
- _(home-manager)_ Justfile replacing tasks.sh
- _(home-manager)_ More updates to make the home-manager setup cleaner
- _(home-manager)_ More updates with foot.nix
- _(home-manager)_ New flack.lock file
- _(home-manager)_ Updates
- _(home-manager)_ Updates
- _(home-manager)_ Updates
- _(home-manager)_ Updates
- _(home-manager)_ Updates
- _(home-manager)_ Updates
- _(home.nix)_ New examples for nix home-manager
- _(ignore config)_ New ignore patterns for fd and ripgrep
- _(install)_ Add more auto configurations on the script
- _(install)_ Adding scripts for post installation
- _(just)_ Added the justfile for just
- _(justfile)_ Add justfile
- _(kitty)_ Change window decoration
- _(kitty)_ Enable horizontal layout
- _(kitty)_ Font size to 15
- _(linux_util)_ Created new python script for linux related scripts
- _(ly)_ Added config options for ly
- _(niri)_ Add firefox and lockscreen and image bindings
- _(niri)_ Added foot key binding
- _(niri)_ Added multiple monitor support
- _(niri)_ Cursor is managed by stylix now
- _(niri)_ Simpler configs and wallpaper change
- _(nix home manager)_ Add nix flake for home manager
- _(nix home manager)_ Update home.nix and flake.lock
- _(nix)_ New config
- _(nix)_ Update home.nix
- _(nom)_ Add more feeds
- _(nom)_ Added config
- _(pyproject)_ I do not need this anymore here
- _(python script)_ Check venv before execute any python script
- _(python scripts)_ Updated python library list and template
- _(python scrtipt)_ Add notes to remember
- _(python)_ Created python folder for all the related projects with the lang
- _(python)_ Created ruff.toml
- _(python)_ Updates
- _(python_path)_ Add libraries to python path
- _(python_pip_update)_ Add mypy to the library list
- _(python_pip_update)_ New list to check for updates
- _(repo)_ Added pre-commit hook typos check and correct
- _(ruff)_ Revamp the config for ruff
- _(shell)_ Activate python environment when bashrc is sourced
- _(shell)_ Add alias related to nix
- _(shell)_ Changed naming from projects to repos
- _(shell)_ Clean up aliases
- _(shell)_ Fixes and updated aliases
- _(shell)_ Sourcing linux_script - required for some of my scripts
- _(starship)_ Remobe pyenv add nix shell
- _(swayidle)_ Update service to run swaylock with background image
- _(system_bootstrap)_ Add dependency for check_driver script
- _(system_bootstrap)_ Updates and code clarity
- _(system_bootstrap.sh)_ Add "less"
- _(system_bootstrap.sh)_ Update list of packages with some notes
- _(system_bootstrap.sh)_ Updated script
- _(system_bootstrap.sh)_ Updates on package and service list
- _(systemd)_ Add config file for swayidle service
- _(typos)_ Add new word to dict
- _(typos)_ Added typos.toml to the project
- _(typos.toml)_ Ignore .ini files
- _(update_everything)_ Added update mirrors function
- _(update_grub.sh)_ New script to update grub when changes implemented
- _(user-dirs.dirs)_ Replaced by nix home-manager
- _(waybar)_ Added wlogout with right click on icon

###  Bug Fixes

- _(README.md)_ Fixed typo
- _(flake.nix)_ Fix error
- _(home-manager)_ Still wrong path
- _(home_manager)_ Created useful script
- _(projects)_ Back to projects folder instead of repos
- _(repo)_ Testing the pre commit hook
- _(scripts)_ Deleted scripts that do not work
- _(shell)_ Helix env variable commented
- _(system_bootstrap.sh)_ Fix spelling

###  Refactor

- _(.aliases)_ Making things clearer
- _(day.sh)_ Small refactoring
- _(folders)_ Creating more folders for clarity
- _(home-manager)_ All imports coming from folder modules

### 📚 Documentation

- _(CHANGELOG)_ Update changelog for the v4.0.0 update
- _(README.md)_ Added archived configs section
- _(README.md)_ More updates
- _(README.md)_ Updated to include more info

###  Styling

- _(config)_ Add last line
- _(waybar)_ Json file format updated

## [4.0.0] - 2024-08-02

### 󰩉 Features

- Add fira code nerd fonts
- _(alacritty)_ Archived alacritty configs.
- _(alacritty)_ Changed fonts to Fira.
- _(alacritty)_ Changed fonts to Hack Nerd Fonts
- _(aliases)_ Add aliases for activate and deactiva virtual env.
- _(archived_configs)_ Moved not used configs to archived_configs folder.
- _(archived_configs)_ Renamed retired_configs to archived_configs
- _(bin)_ Created folder bin for all .sh and .py scripts.
- _(dprint)_ Added dprint in the parent directory
- _(dprint)_ New versions for dprint plugins
- _(git_util.py)_ Created the git util script for all the git custom scripts.
- _(helix)_ Added HELIX_RUNTIME var.
- _(helix)_ Change json formatter to dprint
- _(kitty)_ Add configs for kitty
- _(kitty)_ Add new icons for kitty.
- _(kitty)_ Change fonts other than regular to automated method.
- _(kitty)_ Update config and lcon.
- _(mako)_ Add configuration
- _(niri)_ Added niri wm config file
- _(niri)_ Cleaner config for the app.
- _(niri)_ Completely changed and cleaned the niri configuration.
- _(niri)_ Replaced alacritty for kitty.
- _(niri)_ Stop showing hotkey overlay.
- _(python libraries update)_ Add pylsp to the list
- _(python scripts)_ Add new sudo previous command script
- _(python)_ Add requirements folder with list of critical python libraries
- _(qtile)_ Path fixing and formatting.
- _(qtile)_ Theme nord json format update
- _(requirements)_ Add more important python libraries
- _(scripts)_ Added take_screenshot.sh script
- _(scripts)_ Removing git stash from scripts
- _(scripts_in_python)_ Added exit option for update everything script.
- _(scripts_in_python)_ Updated library list, using uv now
- _(shell)_ Cleaning and stopped X11 start up command.
- _(shell)_ Update new alliases and folders to path
- _(swappy)_ Add configs for the app
- _(systemd)_ Add configs for niri systemd services
- _(update_everything script)_ Update with the correct python function
- _(waybar)_ Cleaner configs for the app.
- _(waybar)_ Completrly reworked the waybar configuration.
- _(wayland)_ Added niri, fuzzel waybar configs.
- _(yazi)_ Add configs for yazi

###  Bug Fixes

- Replace `hx` with `helix`
- _(aliases)_ Added alias for helix.
- _(bashrc)_ Commented pyenv, replaced path for bash-preexec (atuin).
- _(erdtree)_ Remove erdtree aliases, functions and comments
- _(exports)_ Fixed the helix environment runtime variable path
- _(fzf_go_to_path)_ Fixed script now it moves path as well.
- _(fzf_util)_ Moved from 'helix' to 'hx'
- _(git)_ Editor is set to `helix` now.
- _(git/config)_ Switch back to editor `hx` instead of `helix`.
- _(helix language)_ Simplified python config
- _(my_logout)_ Changed logout to niri.
- _(python update libraries)_ New commands to shortcuts to update python libraries
- _(ruff)_ Removed lint that was not working
- _(scripts)_ Merged folders scripts and scripts_in_python into bin.
- _(starship)_ Deactivated jobs task as it was broken
- _(starship)_ Updated broken icons.

### 📚 Documentation

- _(README.md)_ Update application list with links
- _(README.md)_ Updated application list and cleaned up the doc.

<!-- generated by git-cliff -->
