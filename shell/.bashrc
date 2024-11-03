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
add_to_path $HOME/dot/bin/scripts
# cargo - rust applications
# add_to_path $HOME/.local/share/cargo/bin

# brew installation for MacOS
add_to_path /usr/local/opt
add_to_path /usr/local/bin

# source all my scripts, aliases and exports
# -----------------------------------------------
# source_if_exists $HOME/dot/bin/fzf_scripts.sh
source_if_exists $HOME/dot/bin/linux_scripts.sh
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

# uv
eval "$(uv generate-shell-completion bash)"

# Nix
export NIX_PATH=nixpkgs=https://github.com/nixos/nixpkgs/archive/refs/heads/master.tar.gz

# Activate python default virtual environment
activate_uv() {
    # Check if UV_VIRTUAL_ENV is set (environment is already activated)
    if [[ -n "${UV_VIRTUAL_ENV}" ]]; then
        echo "uv virtual environment is already activated."
    else
        # Path to your uv virtual environment
        UV_PATH="$HOME/uv_default"
        
        # Check if the uv directory exists
        if [[ -d "$UV_PATH" ]]; then
            echo "Activating uv virtual environment..."
            source "$UV_PATH/bin/activate"
            if [[ $? -eq 0 ]]; then
                echo "uv virtual environment activated successfully."
            else
                echo "Failed to activate uv virtual environment."
            fi
        else
            echo "uv virtual environment not found at $UV_PATH. Please check the installation."
        fi
    fi
}

# Call the function when .bashrc is sourced
# activate_uv

# Print if the file is sourced
# -----------------------------------------------
echo "-- .bashrc file sourced"
