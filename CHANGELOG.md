# Changelog

All notable changes to this project will be documented in this file.

## [4.7.0] - 2025-12-12

### 󰩉 Features

Add deepseek glm config and rename gemini script
(models) Add pricing information for value for money models
Update configurations for Gemini, Kitty, Ruff, and Yazi
(models) Add new model configuration for minimax paid
(helix) Disable pyls_mypy and add 'ty' language server for Python
Update Python tooling and linting configurations
Enhance gitignore with environment and OS-specific patterns
Add *.egg-info/ to gitignore
(gemini) Configure initial state, enable preview features, and adjust shell environment
(ci) Add comprehensive pre-commit configuration
(python) Update uv configuration and add ruff to lint dependencies
Update linting and formatting to use uv run and integrate ty
Update tool commands to use uv and python3 prefixes
Add justfile for Python project management and refactor shell aliases

###  Refactor

(gemini) Remove obsolete mcpServers configuration
(stylix) Improve formatting and structure of font configuration
(helix) Switch Nix formatter and remove pylsp language server
Optimize dev tooling configuration and performance
Reorganize project conventions and add AI config

### 📚 Documentation

Update Python conventions and Ruff configuration
(python) Added commands for deptry
Add Python exception naming convention
Add Gemini memory for Python refactoring conventions

###  Bug Fixes

Ignore D413 (missing-blank-line-after-last-section) in ruff.toml

###  Refactor

Consolidate Python conventions and project configuration

### ⚙️ Miscellaneous Tasks

Add diff edit format to model scripts and add kimi model

## [4.6.0] - 2025-10-06

### 󰩉 Features

- _(gemini)_ Enable checkpointing
- Update model configurations and add new paid model scripts

###  Refactor

- _(config)_ Reorganize settings.json and add SQL injection guideline

### 📚 Documentation

- Add project conventions and update Python conventions

### ⚙️ Miscellaneous Tasks

- Update .gitignore
- Rename convention files to shorter names
- Update config file paths and add docs link
- Disable history files by setting them to /dev/null
- Update deepseek model reference

## [4.5.0] - 2025-08-31

### 󰩉 Features

- Add model configuration scripts for Gemini and DeepSeek
- _(git)_ Add count parameter to log aliases
- _(helix)_ Increase markdown text width to 120
- Add initial Gemini configuration
- _(gemini)_ Add initial configuration and context

### 📚 Documentation

- Update changelog for v4.5.0 release

### ⚙️ Miscellaneous Tasks

- Update CHANGELOG.md
- Clean up commented-out lines in Gemini work script
- Remove old aider config scripts
- Add match/case convention and adjust Ruff line lengths
- Update python conventions and mypy configuration
- Update git config with aliases, settings and typo fix
- Ignore Gemini AI files
- Ignore Gemini CLI temporary files and installation ID
- Update deepseek model to v3.1

## [4.4.0] - 2025-05-24

### 󰩉 Features

- _(helix)_ Continue to next row if a markdown list
- _(aider)_ Clearer readme, better conventions, working aider.conf.yml
- _(aider)_ Config updates and alias to run venv for aider
- _(aider)_ Update readme and workflow commands
- _(aider)_ Updated CONVENTIONS.md file
- _(aider)_ Better naming for the aider scripts
- _(aider)_ Updated info for different `diff` formats
- _(git)_ Updated pager to `cat`
- _(helix)_ Markdown config updates
- _(aider)_ Added full prompt example
- Add aider script for DeepSeek model configuration
- Improve python conventions and add auto-accept-architect option
- Enable --architect mode for gemini and deepseek scripts
- Add scripts for free Gemini/DeepSeek models
- Add show-release-notes config, update gemini editor model
- Add script for running aider with Gemini 2.5 Pro
- Enable automatic UI coloring in Git
- Add alias for creating and pushing to GitHub repository

###  Bug Fixes

- _(aider)_ Fixing upper case to lower and removing params that do not exist..
- _(aider)_ Removing old naming aider scripts
- _(foot)_ Comment out uri-characters setting
- Correct Gemini 2.5 Pro model name for Vertex AI

### 📚 Documentation

- _(CHANGELOG.md)_ Update changelog file
- _(aider)_ Updated README.md with more explanation and workflow examples
- _(aider)_ Added more notes for README.md
- Add git commit message conventions documentation
- Update README.md with current project status and applications
- Add sonnet conventions documentation file
- Add GIT strategy when working with Aider
- Add git, python, and sonnet conventions documentation
- Update git commit message conventions

### ⚙️ Miscellaneous Tasks

- Improve git aliases and ignore aider working directory
- Update aider config to include additional read-only file
- Update aider configuration and model settings
- Disable architect, update gemini script, add /compact doc
- Switch to experimental Gemini model in helper script
- Disable streaming in aider config
- Add commented-out alternative editor format option
- Add weak Gemini model to aider script
- Update Gemini model versions and edit format flag

### Chore

- Update aider config to point to python conventions file
- Comment out unavailable gemini-2.5 model in vertex_ai

## [4.3.0] - 2025-02-05

### 󰩉 Features

- _(shell)_ Remove z command replaced with zoxide
- _(shell)_ Add .local/bin to path and zoxide
- _(starship)_ Add `.` to fill gap between panels
- _(yazi)_ Update configs
- _(bin)_ Moved all my scripts to a standalone repo
- _(bashrc)_ Add path for the sops key
- _(.bashrc)_ Add path for personal scripts
- _(.aliases)_ Update alises related to lunix_util.py
- _(.exports)_ Export variable for homebrew
- _(helix)_ Change markdown LSP to 'markdown-oxide'
- _(helix)_ Switched to markdown oxide instead of marksman
- _(helix)_ Add `typos` for typo checking to markdown config
- _(aider)_ Add .env with aider configurations
- _(aider)_ Updates to .env file
- _(aider)_ Many updates with the config
- _(helix)_ Languages config updates

###  Bug Fixes

- _(bash_profile)_ Moved GCP installation to $HOME
- _(README.md)_ Fixed grammar errors
- _(README.md)_ Fixed the call out
- _(README.md)_ Fixed small typo

### 📚 Documentation

- _(changelog.md)_ Add new changelog for 4.2
- _(README.md)_ Updated current status of usage of repo
- _(aider)_ Added more info into README.md file

## [4.2.0] - 2024-12-19

### 󰩉 Features

- _(python-dev.nix)_ Add nix shell python enviroment
- _(home.nix)_ Add more applications
- _(.aliases)_ Add more alliases and group commands better
- _(stylix)_ Switching icons package
- _(home-manager)_ Add not free apps option
- _(polars)_ Moved it to python folder
- _(justfile)_ No more debug mode for gc command
- _(home-manager)_ Add more applications managed by hm
- _(home)_ New formatter and LSP for nix
- _(home)_ New formatter and LSP for nix
- _(typos)_ Add word
- _(nushell)_ Init nushell config
- _(home-manager)_ Add some useful configs for later
- _(shell)_ Add inputrc
- _(bin)_ Add more links to check for git updates
- _(aliases)_ Remove reduntant code
- _(.install)_ Added ufw as potential services to activate when new install
- _(niri)_ Add spawn at start up the waypaper --restore
- _(waypaper)_ Add config
- _(home-manager)_ Add more programs
- _(niri)_ Add waybar to spawn at startup
- _(kitty)_ Kitty conf managed by home manager now
- _(kitty)_ Back to previous setup without nix home-manager
- _(helix)_ Add grammar for more languages
- _(nushell)_ Add more configs for nu
- _(.gitignore)_ Update with new rule
- _(python)_ Add more core python libraries to the file

###  Bug Fixes

- _(aliases)_ Typo
- _(.aliases)_ Remove dupe
- _(cargo)_ Remove to source cargo folder
- _(bash)_ Remove tool PATH for uv tools

### 📚 Documentation

- _(CHANGELOG.md)_ Add new release notes

### Home-manager/flake.lock

- Update
- Update
- Update
- Update
- Update

## [4.1.0] - 2024-10-12

### 󰩉 Features

- _(python_pip_update)_ Add mypy to the library list
- _(nix home manager)_ Add nix flake for home manager
- _(nix home manager)_ Update home.nix and flake.lock
- _(nix)_ Update home.nix
- _(nix)_ New config
- _(home manager nix)_ Update configs
- _(niri)_ Simpler configs and wallpaper change
- _(bin)_ Update scripts
- _(helix)_ New shortcuts and confing cleaning
- _(helix)_ Add nix formater
- _(kitty)_ Font size to 15
- _(shell)_ Sourcing linux_script - required for some of my scripts
- _(home manager nix)_ Add modules folder and refactoring
- _(shell)_ Add alias related to nix
- _(kitty)_ Change window decoration
- _(home manager nix)_ Moved to the unstable
- _(niri)_ Added mutiple monitor support
- _(install)_ Adding scripts for post installation
- _(helix)_ Added new shorcuts to close buffers
- _(python)_ Created python folder for all the related projects with the lang
- _(install)_ Add more auto configurations on the script
- _(python)_ Created ruff.toml
- _(systemd)_ Add config file for swayidle service
- _(system_bootstrap.sh)_ Update list of packages with some notes
- _(.exports)_ Fix FZF main command
- _(.install)_ More automated functions to bootstrap system
- _(python scripts)_ Updated python library list and template
- _(system_bootstrap.sh)_ Updated script
- _(folders)_ Moved files to their own folders
- _(bravebookmarks.sh)_ Replaced rofi for fuzzel
- _(update_grub.sh)_ New script to update grub when changes implemented
- _(home-manager)_ New flack.lock file
- _(niri)_ Add firefox and lockscreen and image bindings
- _(waybar)_ Added wlogout with right click on icon
- _(bashrc)_ Added Nix path
- _(swayidle)_ Update service to run swaylock with background image
- _(.aliases)_ Update home-manager shortcut alias
- _(system_bootstrap.sh)_ Updates on package and service list
- _(bin)_ Seperating standalone scripts and utilities
- _(ly)_ Added config options for ly
- _(shell)_ Changed naming from projects to repos
- _(system_bootstrap)_ Updates and code clarity
- _(browser_bookmarks)_ Updated scripts for brave and firefox
- _(home.nix)_ New examples for nix home-manager
- _(aliases)_ Add small function to run previous command with sudo
- _(python_path)_ Add libraries to python path
- _(ignore config)_ New ignore patterns for fd and ripgrep
- _(python_pip_update)_ New list to check for updates
- _(fd)_ Ignore more directories i dont use
- _(dprint)_ Update include files and versions
- _(pyproject)_ I do not need this anymore here
- _(python)_ Updates
- _(bin)_ Cleaning scripts
- _(linux_util)_ Created new python script for linux related scripts
- _(shell)_ Fixes and updated aliases
- _(system_boostrap)_ Add dependency for check_driver scipt
- _(ruff)_ Revamp the config for ruff
- _(home-manager)_ Add yet another package managed by nix hm
- _(git)_ Update ignore list
- _(atuin)_ Change search to fuzzy
- _(python sctipt)_ Add notes to remember
- _(kitty)_ Enable horizontal layout
- _(starship)_ Remobe pyenv add nix shell
- _(python script)_ Check venv before execute any python script
- _(shell)_ Activate python enviroment when bashrc is sourced
- _(home-manager)_ Updates
- _(home-manager)_ Updates
- _(niri)_ Cursor is managed by stylix now
- _(home-manager)_ Updates
- _(aliases)_ Finally having the correct path for home-manager switch anywhere
- _(home-manager)_ Updates
- _(home-manager)_ Added firefox.nix with firefox configs
- _(firefox.nix)_ Add more custom settings for firefox
- _(home-manager)_ Updates
- _(just)_ Added the justfile for just
- _(home-manager)_ Added ly.nix
- _(home-manager)_ Added font.nix
- _(home-manager)_ Added zathura.nix
- _(home-manager)_ Add second file justfile
- _(justfile)_ Add justfile
- _(home-manager)_ Add fastfetch.nix
- _(home-manager)_ Updates
- _(home-manager)_ More updates to make the home-manager setup cleaner
- _(home-manager)_ Justfile replacing tasks.sh
- _(shell)_ Clean up aliases
- _(home-manager)_ Added fonts into stylix
- _(user-dirs.dirs)_ Replaced by nix home-manager
- _(repo)_ Added pre-commit hook typos check and correct
- _(home-manager)_ Add foot.nix configs
- _(.install)_ Added mesa removed nautilus
- _(typos)_ Added typos.toml to the project
- _(niri)_ Added foot key binding
- _(home-manager)_ Added module foot.nix
- _(.exports)_ Update browser variable
- _(typos.toml)_ Ignore .ini files
- _(files)_ Fixed a lot of typos
- _(README.md)_ Update the application list i use
- _(home-manager)_ More updates with foot.nix
- _(system_bootstrap.sh)_ Add "less"
- _(.aliases)_ New alias p3 added
- _(nom)_ Added config
- _(update_everything)_ Added update mirrors function
- _(nom)_ Add more feeds
- _(home-manager)_ Add more packages to install
- _(typos)_ Add new word to dict
- _(.bashrc)_ Deactivate function that activates the virtual py env
- _(bin)_ Move all bash scripts to /usr/bin/env bash shebang

###  Bug Fixes

- _(home_manager)_ Created useful script
- _(shell)_ Helix env variable commented
- _(system_bootstrap.sh)_ Fix spelling
- _(projects)_ Back to projects folder instead of repos
- _(scripts)_ Deleted scripts that do not work
- _(flake.nix)_ Fix error
- _(home-manager)_ Still wrong path
- _(README.md)_ Fixed typo
- _(repo)_ Testing the pre commit hook

###  Refactor

- _(folders)_ Creating more folders for clarity
- _(.aliases)_ Making things clearer
- _(day.sh)_ Small refactoring
- _(home-manager)_ All imports coming from folder modules

### 📚 Documentation

- _(CHANGELOG)_ Update changelog for the v4.0.0 update
- _(README.md)_ Updated to include more info
- _(README.md)_ More updates
- _(README.md)_ Added archived configs section

###  Styling

- _(waybar)_ Json file format updated
- _(config)_ Add last line

### Home-manager/flake.lock

- Update
- Update
- Update
- Update
- Update

## [4.0.0] - 2024-08-02

### 󰩉 Features

- Add fira code nerd fonts
- _(helix)_ Added HELIX_RUNTIME var.
- _(python)_ Add requirements folder with list of critical python libraries
- _(alacritty)_ Changed fonts to Hack Nerd Fonts
- _(scripts_in_python)_ Updated library list, using uv now
- _(requirements)_ Add more important python libraries
- _(aliases)_ Add aliases for activate and deactiva virtual env.
- _(python scripts)_ Add new sudo previous command script
- _(python libraries update)_ Add pylsp to the list
- _(dprint)_ New versions for dprint plugins
- _(update_everything script)_ Update with the correct python function
- _(helix)_ Change json formater to dprint
- _(qtile)_ Theme nord json format update
- _(niri)_ Added niri wm config file
- _(wayland)_ Added niri, fuzzel waybar configs.
- _(mako)_ Add configuration
- _(waybar)_ Completly reworked the waybar configuration.
- _(niri)_ Completely changed and cleaned the niri configuration.
- _(swappy)_ Add configs for the app
- _(dprint)_ Added dprint in the parent directory
- _(scripts)_ Added take_screenshot.sh script
- _(waybar)_ Cleaner configs for the app.
- _(niri)_ Cleaner config for the app.
- _(archived_configs)_ Renamed retired_configs to archived_configs
- _(systemd)_ Add configs for niri systemd services
- _(archived_configs)_ Moved not used configs to archived_configs folder.
- _(scripts)_ Removing git stash from scripts
- _(kitty)_ Add configs for kitty
- _(yazi)_ Add configs for yazi
- _(niri)_ Replaced alacritty for kitty.
- _(alacritty)_ Changed fonts to Fira.
- _(shell)_ Cleaning and stopped X11 start up command.
- _(kitty)_ Update config and lcon.
- _(scripts_in_python)_ Added exit option for update everything script.
- _(alacritty)_ Archived alacritty configs.
- _(kitty)_ Change fonts other than regular to automated method.
- _(kitty)_ Add new icons for kitty.
- _(qtile)_ Path fixing and formating.
- _(bin)_ Created folder bin for all .sh and .py scripts.
- _(git_util.py)_ Created the git util script for all the git custom scripts.
- _(shell)_ Update new alliases and folders to path
- _(niri)_ Stop showing hotkey overlay.

###  Bug Fixes

- Replace `hx` with `helix`
- _(starship)_ Updated broken icons.
- _(git)_ Editor is set to `helix` now.
- _(aliases)_ Added alias for helix.
- _(bashrc)_ Commented pyenv, replaced path for bash-preexec (atuin).
- _(starship)_ Deactivated jobs task as it was broken
- _(git/config)_ Switch back to editor `hx` instead of `helix`.
- _(helix language)_ Simplified python config
- _(ruff)_ Removed lint that was not working
- _(fzf_util)_ Moved from 'helix' to 'hx'
- _(python update libraries)_ New commands to shortcuts to update python libraries
- _(exports)_ Fixed the helix enviromental runtime variable path
- _(my_logout)_ Changed logout to niri.
- _(scripts)_ Merged folders scripts and scripts_in_pyhton into bin.
- _(fzf_go_to_path)_ Fixed script now it moves path as well.
- _(erdtree)_ Remove erdtree aliases, functions and comments

### 📚 Documentation

- _(README.md)_ Update application list with links
- _(README.md)_ Updated application list and cleaned up the doc.

## [1.0.0] - 2022-01-02

<!-- generated by git-cliff -->
