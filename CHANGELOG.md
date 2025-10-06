# Changelog

All notable changes to this project will be documented in this file.

## [4.6.0] - 2025-10-06

### 󰩉 Features

- *(gemini)* Enable checkpointing
- Update model configurations and add new paid model scripts

###  Refactor

- *(config)* Reorganize settings.json and add SQL injection guideline

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
- *(git)* Add count parameter to log aliases
- *(helix)* Increase markdown text width to 120
- Add initial Gemini configuration
- *(gemini)* Add initial configuration and context

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

- *(helix)* Continue to next row if a markdown list
- *(aider)* Clearer readme, better conventions, working aider.conf.yml
- *(aider)* Config updates and alias to run venv for aider
- *(aider)* Update readme and workflow commands
- *(aider)* Updated CONVENTIONS.md file
- *(aider)* Better naming for the aider scripts
- *(aider)* Updated info for different `diff` formats
- *(git)* Updated pager to `cat`
- *(helix)* Markdown config updates
- *(aider)* Added full prompt example
- Add aider script for DeepSeek model configuration
- Improve python conventions and add auto-accept-architect option
- Enable --architect mode for gemini and deepseek scripts
- Add scripts for free Gemini/DeepSeek models
- Add show-release-notes config, update gemini editor model
- Add script for running aider with Gemini 2.5 Pro
- Enable automatic UI coloring in Git
- Add alias for creating and pushing to GitHub repository

###  Bug Fixes

- *(aider)* Fixing upper case to lower and removing params that do not exist..
- *(aider)* Removing old naming aider scripts
- *(foot)* Comment out uri-characters setting
- Correct Gemini 2.5 Pro model name for Vertex AI

### 📚 Documentation

- *(CHANGELOG.md)* Update changelog file
- *(aider)* Updated README.md with more explanation and workflow examples
- *(aider)* Added more notes for README.md
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

- *(shell)* Remove z command replaced with zoxide
- *(shell)* Add .local/bin to path and zoxide
- *(starship)* Add `.` to fill gap between panels
- *(yazi)* Update configs
- *(bin)* Moved all my scripts to a standalone repo
- *(bashrc)* Add path for the sops key
- *(.bashrc)* Add path for personal scripts
- *(.aliases)* Update alises related to lunix_util.py
- *(.exports)* Export variable for homebrew
- *(helix)* Change markdown LSP to 'markdown-oxide'
- *(helix)* Switched to markdown oxide instead of marksman
- *(helix)* Add `typos` for typo checking to markdown config
- *(aider)* Add .env with aider configurations
- *(aider)* Updates to .env file
- *(aider)* Many updates with the config
- *(helix)* Languages config updates

###  Bug Fixes

- *(bash_profile)* Moved GCP installation to $HOME
- *(README.md)* Fixed grammar errors
- *(README.md)* Fixed the call out
- *(README.md)* Fixed small typo

### 📚 Documentation

- *(changelog.md)* Add new changelog for 4.2
- *(README.md)* Updated current status of usage of repo
- *(aider)* Added more info into README.md file

## [4.2.0] - 2024-12-19

### 󰩉 Features

- *(python-dev.nix)* Add nix shell python enviroment
- *(home.nix)* Add more applications
- *(.aliases)* Add more alliases and group commands better
- *(stylix)* Switching icons package
- *(home-manager)* Add not free apps option
- *(polars)* Moved it to python folder
- *(justfile)* No more debug mode for gc command
- *(home-manager)* Add more applications managed by hm
- *(home)* New formatter and LSP for nix
- *(home)* New formatter and LSP for nix
- *(typos)* Add word
- *(nushell)* Init nushell config
- *(home-manager)* Add some useful configs for later
- *(shell)* Add inputrc
- *(bin)* Add more links to check for git updates
- *(aliases)* Remove reduntant code
- *(.install)* Added ufw as potential services to activate when new install
- *(niri)* Add spawn at start up the waypaper --restore
- *(waypaper)* Add config
- *(home-manager)* Add more programs
- *(niri)* Add waybar to spawn at startup
- *(kitty)* Kitty conf managed by home manager now
- *(kitty)* Back to previous setup without nix home-manager
- *(helix)* Add grammar for more languages
- *(nushell)* Add more configs for nu
- *(.gitignore)* Update with new rule
- *(python)* Add more core python libraries to the file

###  Bug Fixes

- *(aliases)* Typo
- *(.aliases)* Remove dupe
- *(cargo)* Remove to source cargo folder
- *(bash)* Remove tool PATH for uv tools

### 📚 Documentation

- *(CHANGELOG.md)* Add new release notes

### Home-manager/flake.lock

- Update
- Update
- Update
- Update
- Update

## [4.1.0] - 2024-10-12

### 󰩉 Features

- *(python_pip_update)* Add mypy to the library list
- *(nix home manager)* Add nix flake for home manager
- *(nix home manager)* Update home.nix and flake.lock
- *(nix)* Update home.nix
- *(nix)* New config
- *(home manager nix)* Update configs
- *(niri)* Simpler configs and wallpaper change
- *(bin)* Update scripts
- *(helix)* New shortcuts and confing cleaning
- *(helix)* Add nix formater
- *(kitty)* Font size to 15
- *(shell)* Sourcing linux_script - required for some of my scripts
- *(home manager nix)* Add modules folder and refactoring
- *(shell)* Add alias related to nix
- *(kitty)* Change window decoration
- *(home manager nix)* Moved to the unstable
- *(niri)* Added mutiple monitor support
- *(install)* Adding scripts for post installation
- *(helix)* Added new shorcuts to close buffers
- *(python)* Created python folder for all the related projects with the lang
- *(install)* Add more auto configurations on the script
- *(python)* Created ruff.toml
- *(systemd)* Add config file for swayidle service
- *(system_bootstrap.sh)* Update list of packages with some notes
- *(.exports)* Fix FZF main command
- *(.install)* More automated functions to bootstrap system
- *(python scripts)* Updated python library list and template
- *(system_bootstrap.sh)* Updated script
- *(folders)* Moved files to their own folders
- *(bravebookmarks.sh)* Replaced rofi for fuzzel
- *(update_grub.sh)* New script to update grub when changes implemented
- *(home-manager)* New flack.lock file
- *(niri)* Add firefox and lockscreen and image bindings
- *(waybar)* Added wlogout with right click on icon
- *(bashrc)* Added Nix path
- *(swayidle)* Update service to run swaylock with background image
- *(.aliases)* Update home-manager shortcut alias
- *(system_bootstrap.sh)* Updates on package and service list
- *(bin)* Seperating standalone scripts and utilities
- *(ly)* Added config options for ly
- *(shell)* Changed naming from projects to repos
- *(system_bootstrap)* Updates and code clarity
- *(browser_bookmarks)* Updated scripts for brave and firefox
- *(home.nix)* New examples for nix home-manager
- *(aliases)* Add small function to run previous command with sudo
- *(python_path)* Add libraries to python path
- *(ignore config)* New ignore patterns for fd and ripgrep
- *(python_pip_update)* New list to check for updates
- *(fd)* Ignore more directories i dont use
- *(dprint)* Update include files and versions
- *(pyproject)* I do not need this anymore here
- *(python)* Updates
- *(bin)* Cleaning scripts
- *(linux_util)* Created new python script for linux related scripts
- *(shell)* Fixes and updated aliases
- *(system_boostrap)* Add dependency for check_driver scipt
- *(ruff)* Revamp the config for ruff
- *(home-manager)* Add yet another package managed by nix hm
- *(git)* Update ignore list
- *(atuin)* Change search to fuzzy
- *(python sctipt)* Add notes to remember
- *(kitty)* Enable horizontal layout
- *(starship)* Remobe pyenv add nix shell
- *(python script)* Check venv before execute any python script
- *(shell)* Activate python enviroment when bashrc is sourced
- *(home-manager)* Updates
- *(home-manager)* Updates
- *(niri)* Cursor is managed by stylix now
- *(home-manager)* Updates
- *(aliases)* Finally having the correct path for home-manager switch anywhere
- *(home-manager)* Updates
- *(home-manager)* Added firefox.nix with firefox configs
- *(firefox.nix)* Add more custom settings for firefox
- *(home-manager)* Updates
- *(just)* Added the justfile for just
- *(home-manager)* Added ly.nix
- *(home-manager)* Added font.nix
- *(home-manager)* Added zathura.nix
- *(home-manager)* Add second file justfile
- *(justfile)* Add justfile
- *(home-manager)* Add fastfetch.nix
- *(home-manager)* Updates
- *(home-manager)* More updates to make the home-manager setup cleaner
- *(home-manager)* Justfile replacing tasks.sh
- *(shell)* Clean up aliases
- *(home-manager)* Added fonts into stylix
- *(user-dirs.dirs)* Replaced by nix home-manager
- *(repo)* Added pre-commit hook typos check and correct
- *(home-manager)* Add foot.nix configs
- *(.install)* Added mesa removed nautilus
- *(typos)* Added typos.toml to the project
- *(niri)* Added foot key binding
- *(home-manager)* Added module foot.nix
- *(.exports)* Update browser variable
- *(typos.toml)* Ignore .ini files
- *(files)* Fixed a lot of typos
- *(README.md)* Update the application list i use
- *(home-manager)* More updates with foot.nix
- *(system_bootstrap.sh)* Add "less"
- *(.aliases)* New alias p3 added
- *(nom)* Added config
- *(update_everything)* Added update mirrors function
- *(nom)* Add more feeds
- *(home-manager)* Add more packages to install
- *(typos)* Add new word to dict
- *(.bashrc)* Deactivate function that activates the virtual py env
- *(bin)* Move all bash scripts to /usr/bin/env bash shebang

###  Bug Fixes

- *(home_manager)* Created useful script
- *(shell)* Helix env variable commented
- *(system_bootstrap.sh)* Fix spelling
- *(projects)* Back to projects folder instead of repos
- *(scripts)* Deleted scripts that do not work
- *(flake.nix)* Fix error
- *(home-manager)* Still wrong path
- *(README.md)* Fixed typo
- *(repo)* Testing the pre commit hook

###  Refactor

- *(folders)* Creating more folders for clarity
- *(.aliases)* Making things clearer
- *(day.sh)* Small refactoring
- *(home-manager)* All imports coming from folder modules

### 📚 Documentation

- *(CHANGELOG)* Update changelog for the v4.0.0 update
- *(README.md)* Updated to include more info
- *(README.md)* More updates
- *(README.md)* Added archived configs section

###  Styling

- *(waybar)* Json file format updated
- *(config)* Add last line

### Home-manager/flake.lock

- Update
- Update
- Update
- Update
- Update

## [4.0.0] - 2024-08-02

### 󰩉 Features

- Add fira code nerd fonts
- *(helix)* Added HELIX_RUNTIME var.
- *(python)* Add requirements folder with list of critical python libraries
- *(alacritty)* Changed fonts to Hack Nerd Fonts
- *(scripts_in_python)* Updated library list, using uv now
- *(requirements)* Add more important python libraries
- *(aliases)* Add aliases for activate and deactiva virtual env.
- *(python scripts)* Add new sudo previous command script
- *(python libraries update)* Add pylsp to the list
- *(dprint)* New versions for dprint plugins
- *(update_everything script)* Update with the correct python function
- *(helix)* Change json formater to dprint
- *(qtile)* Theme nord json format update
- *(niri)* Added niri wm config file
- *(wayland)* Added niri, fuzzel waybar configs.
- *(mako)* Add configuration
- *(waybar)* Completly reworked the waybar configuration.
- *(niri)* Completely changed and cleaned the niri configuration.
- *(swappy)* Add configs for the app
- *(dprint)* Added dprint in the parent directory
- *(scripts)* Added take_screenshot.sh script
- *(waybar)* Cleaner configs for the app.
- *(niri)* Cleaner config for the app.
- *(archived_configs)* Renamed retired_configs to archived_configs
- *(systemd)* Add configs for niri systemd services
- *(archived_configs)* Moved not used configs to archived_configs folder.
- *(scripts)* Removing git stash from scripts
- *(kitty)* Add configs for kitty
- *(yazi)* Add configs for yazi
- *(niri)* Replaced alacritty for kitty.
- *(alacritty)* Changed fonts to Fira.
- *(shell)* Cleaning and stopped X11 start up command.
- *(kitty)* Update config and lcon.
- *(scripts_in_python)* Added exit option for update everything script.
- *(alacritty)* Archived alacritty configs.
- *(kitty)* Change fonts other than regular to automated method.
- *(kitty)* Add new icons for kitty.
- *(qtile)* Path fixing and formating.
- *(bin)* Created folder bin for all .sh and .py scripts.
- *(git_util.py)* Created the git util script for all the git custom scripts.
- *(shell)* Update new alliases and folders to path
- *(niri)* Stop showing hotkey overlay.

###  Bug Fixes

- Replace `hx` with `helix`
- *(starship)* Updated broken icons.
- *(git)* Editor is set to `helix` now.
- *(aliases)* Added alias for helix.
- *(bashrc)* Commented pyenv, replaced path for bash-preexec (atuin).
- *(starship)* Deactivated jobs task as it was broken
- *(git/config)* Switch back to editor `hx` instead of `helix`.
- *(helix language)* Simplified python config
- *(ruff)* Removed lint that was not working
- *(fzf_util)* Moved from 'helix' to 'hx'
- *(python update libraries)* New commands to shortcuts to update python libraries
- *(exports)* Fixed the helix enviromental runtime variable path
- *(my_logout)* Changed logout to niri.
- *(scripts)* Merged folders scripts and scripts_in_pyhton into bin.
- *(fzf_go_to_path)* Fixed script now it moves path as well.
- *(erdtree)* Remove erdtree aliases, functions and comments

### 📚 Documentation

- *(README.md)* Update application list with links
- *(README.md)* Updated application list and cleaned up the doc.

## [1.0.0] - 2022-01-02

<!-- generated by git-cliff -->
