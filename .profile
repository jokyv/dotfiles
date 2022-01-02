if [ -f ~/.bashrc ]; then . ~/.bashrc; fi

# =============================================================================
# Setting up defaults
export EDITOR='lvim'
export VISUAL='lvim'
export BROWSER='firefox'
export TERMINAL='alacritty'
export COLORTERM='truecolor'
export WM='bspwm'

# =============================================================================
# ~/ clean up
export XGD_DATA_HOME=${XDG_DATA_HOME:="$HOME/.local/share"}
export XDG_CACHE_HOME=${XDG_CACHE_HOME:="$HOME/.cache"}
export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:="$HOME/.config"}
#export XDG_RUNTIME_DIR=${XDG_RUNTIME_DIR:="$HOME/.config/runtime_dir/"}

# disable LESS history file
export LESSHISTFILE="-"

# i need this way so it gets the default path
# in case XDG_DATA_HOME etc is not seu
export CARGO_HOME="${XDG_DATA_HOME:-$HOME/.local/share}/cargo"
export RUSTUP_HOME="${XDG_DATA_HOME:-$HOME/.local/share}/rustup"
export HISTFILE="${XDG_DATA_HOME:-$HOME/.local/share}/bash/history"
export GNUPGHOME="${XDG_DATA_HOME:-$HOME/.local/share}/gnupg"
export PYLINTHOME="${XDG_DATA_HOME:-$HOME/.local/share}/pylint"
export XINITRC="${XDG_CONFIG_HOME:-$HOME/.config}/X11/xinitrc"
#export XAUTHORITY="$XDG_RUNTIME_DIR"/Xauthority 
# for global git is using the $XDG_CONFIG_HOME

# i am adding it to path via bashrc
# export PATH="$HOME/.local/share/cargo/bin:$PATH"

# =============================================================================
# FZF
# <CTRL+R> search history of shell commands
# FZF_DEFAULT_COMMAND is piped into fzf if you run fzf without any input. 
# So, with this setup, fd . $HOME | fzf and fzf do the same thing.
export FZF_DEFAULT_OPTS="--layout=reverse --height 40%"
export FZF_DEFAULT_COMMAND="fd . $HOME"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd -td . $HOME" 
# the below seems not working with mac
#source /usr/share/fzf/completion.bash
#source /usr/share/fzf/key-bindings.bash

# binding my fzf scripts instead of alliases
# bind '"\C-f":"cd_with_fzf\n"'
# bind '"\C-o":"open_with_fzf\n"'
# bind '"\C-v":"nvim\n"'

# note you can use .gitignore file in $HOME to ignore folders that you dont 
# want the FZF to search and hence speed up performance!

# =============================================================================
# launch starx automatically
if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
exec startx "$XDG_CONFIG_HOME/X11/xinitrc"
fi

echo "-- .profile file sourced"
