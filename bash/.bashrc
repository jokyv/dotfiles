# Bash configurations

# start tmux every time you open the terminal
# only when you are on mac
if [[ "$OSTYPE" == "darwin"* ]]; then
  if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
    exec tmux
  fi
fi

# if $PATH has multiples remove them
function addToPATH {
  case ":$PATH:" in
    *":$1:"*) :;; # already there
    *) PATH="$1:$PATH";; # or PATH="$PATH:$1"
  esac
}

# my own scripts
addToPATH $HOME/dot/scripts
# cargo - rust applications
addToPATH $HOME/.local/share/cargo/bin
# add python3 for linux
addToPATH $HOME/.local/bin
# add python3 for mac
export PYTHONPATH="${PYTHONPATH}:$HOME/projects/python_path"
addToPATH /usr/local/opt/python/libexec/bin
addToPATH /usr/local/bin

# # my own git scripts
# addToPATH $HOME/dot/scripts/git_scripts.sh
# # my own fzf scripts
# addToPATH $HOME/dot/scripts/fzf_scripts.sh
# # conda distribution
# addToPATH $HOME/mconda/bin/

# load bash aliases
[ -f $HOME/dot/.aliases ] && source $HOME/dot/.aliases

# misc settings
set -o vi # enable vim keystrokes in terminal
shopt -s cdspell 
bind 'set completion-ignore-case on'
complete -d cd

# need this for starship
eval "$(starship init bash)"


echo "-- .bashrc file sourced"
