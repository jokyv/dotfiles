# Bash configurations

# start zellij every time you open the terminal on macOS
# ------------------------------------------------------
if [[ "$OSTYPE" == "darwin"* ]]; then
# if [[ "$OSTYPE" == "linux-gnu"* ]]; then
  if command -v zellij &> /dev/null && 
  [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && 
  [[ ! "$TERM" =~ zellij ]] && 
  [ -z "$ZELLIJ" ]; then
    eval "$(zellij setup --generate-auto-start bash)"
  fi
fi

# if $PATH has multiples remove them
# ----------------------------------
function add_to_path {
  case ":$PATH:" in
    *":$1:"*) :;; # already there
    *) PATH="$1:$PATH";; # or PATH="$PATH:$1"
  esac
}

# add to $PATH
# ------------
# my own personal scripts
add_to_path $HOME/dot/scripts
# my own personal scripts in rust
add_to_path $HOME/dot/scripts_in_rust
# add my own libraries to python path
add_to_path $HOME/projects/python_path
# cargo - rust applications
add_to_path $HOME/.local/share/cargo/bin

# add to $PATH my own python libraries
export PYTHONPATH="${PYTHONPATH}:$HOME/projects/python_path"
# export PYTHONPATH="${PYTHONPATH}:$HOME/.local/lib/python3.10/site-packages"

# export IBM_DB_HOME=/usr/local/lib/python3.10/site-packages/clidriver
# export DYLD_LIBRARY_PATH=$IBM_DB_HOME/lib:$DYLD_LIBRARY_PATH

# brew installation
add_to_path /usr/local/opt
add_to_path /usr/local/bin

# old setup for my scripts
# # my own git scripts
# addToPATH $HOME/dot/scripts/git_scripts.sh
# # my own fzf scripts
# addToPATH $HOME/dot/scripts/fzf_scripts.sh

# export PATH=/usr/local/opt/sqlite/bin:$PATH

# Load all my aliases
# -------------------
[ -f $HOME/dot/.aliases ] && source $HOME/dot/.aliases

# Misc settings
# -------------
set -o vi # enable vim keystrokes in terminal
shopt -s cdspell 
bind 'set completion-ignore-case on'
complete -d cd

# Need this for applications
# --------------------------
# pyenv
eval "$(pyenv virtualenv-init -)"
# starship
eval "$(starship init bash)"
#atuin
[[ -f $HOME/projects/.bash-preexec.sh ]] && source $HOME/projects/.bash-preexec.sh
eval "$(atuin init bash)"

# Print if the file is sourced
# ----------------------------
echo "-- .bashrc file sourced"

