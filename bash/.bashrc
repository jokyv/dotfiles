# Bash configurations

# start tmux every time you open the terminal
# only when you are on mac
# if [[ "$OSTYPE" == "darwin"* ]]; then
#   if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
#     exec tmux
#   fi
# fi

# start zellij every time you open the terminal
# ----------------------------------------------------------------------------
# only when you are on mac
if [[ "$OSTYPE" == "darwin"* ]]; then
  if command -v zellij &> /dev/null && 
  [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && 
  [[ ! "$TERM" =~ zellij ]] && 
  [ -z "$ZELLIJ" ]; then
    exec zellij
  fi
fi

# if $PATH has multiples remove them
function add_to_path {
  case ":$PATH:" in
    *":$1:"*) :;; # already there
    *) PATH="$1:$PATH";; # or PATH="$PATH:$1"
  esac
}

# ADD TO $PATH
# ----------------------------------------------------------------------------
# my own personal scripts
add_to_path $HOME/dot/scripts
# cargo - rust applications
add_to_path $HOME/.local/share/cargo/bin

# add python3 for linux - old paths
add_to_path $HOME/.local/bin
# add_to_path $HOME/.local/lib/python3.9/site-packages
add_to_path $HOME/.local/lib/python3.10/site-packages
# add python and site-packages (whole directory)
# add_to_path $HOME/.local/

# add to $PATH my own python libraries
export PYTHONPATH="${PYTHONPATH}:$HOME/projects/python_path"
export PYTHONPATH="${PYTHONPATH}:$HOME/.local/lib/python3.10/site-packages"

# add python3 for mac
# add_to_path /usr/local/opt/python/libexec/bin
add_to_path /usr/local/bin

# old setup for my scripts
# # my own git scripts
# addToPATH $HOME/dot/scripts/git_scripts.sh
# # my own fzf scripts
# addToPATH $HOME/dot/scripts/fzf_scripts.sh
# # conda distribution
# addToPATH $HOME/mconda/bin/

# load bash aliases
[ -f $HOME/dot/.aliases ] && source $HOME/dot/.aliases

# misc settings
# ----------------------------------------------------------------------------
set -o vi # enable vim keystrokes in terminal
shopt -s cdspell 
bind 'set completion-ignore-case on'
complete -d cd

# need this for starship
# ----------------------------------------------------------------------------
eval "$(starship init bash)"

# need this for atuin
# ----------------------------------------------------------------------------
# [[ -f $HOME/projects/.bash-preexec.sh ]] && source $HOME/projects/.bash-preexec.sh
# eval "$(atuin init bash)"

echo "-- .bashrc file sourced"

