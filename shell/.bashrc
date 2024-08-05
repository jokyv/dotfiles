# Bash configurations

# Misc settings - always on top of the file
# -----------------------------------------------
set -o vi # enable vim keystrokes in terminal
shopt -s cdspell # autocorrect typos in path when using cd
bind 'set completion-ignore-case on'
complete -d cd

# add to $PATH, if $PATH has multiples remove them
# -----------------------------------------------
function add_to_path {
  case ":$PATH:" in
    *":$1:"*) :;; # already there
    *) PATH="$1:$PATH";; # or PATH="$PATH:$1"
  esac
}

# function that will source a file if it exist
# basically will replace the following
# [ -f $HOME/dot/.aliases ] && source $HOME/dot/.aliases
# -----------------------------------------------
function source_if_exists {
    if test -r "$1"; then source "$1"
    fi
}

# add to $PATH
# -----------------------------------------------
# my own personal scripts
add_to_path $HOME/dot/bin
# add my own libraries to python path
add_to_path $HOME/projects/python_path
# cargo - rust applications
add_to_path $HOME/.local/share/cargo/bin

# brew installation
add_to_path /usr/local/opt
add_to_path /usr/local/bin

# source all my scripts
# -----------------------------------------------
source_if_exists $HOME/dot/bin/fzf_scripts.sh
source_if_exists $HOME/dot/bin/linux_scripts.sh
# source_if_exists $HOME/dot/bin/git_scripts.sh

# source all my aliases and exports
# -----------------------------------------------
source_if_exists $HOME/dot/shell/.aliases
source_if_exists $HOME/dot/shell/.exports

# Need this for the following applications
# -----------------------------------------------
# starship
eval "$(starship init bash)"

# atuin
# [[ -f ~/.bash-preexec.sh ]] && source ~/.bash-preexec.sh
source_if_exists $HOME/.bash-preexec.sh
eval "$(atuin init bash)"

# Print if the file is sourced
# -----------------------------------------------
echo "-- .bashrc file sourced"
