# function that will source a file if it exist
# basically will replace the following
# [ -f $HOME/dot/.aliases ] && source $HOME/dot/.aliases
# ----------------------------------------------------------------------------
function source_if_exists {
    if test -r "$1"; then source "$1"
    fi
}

# need this for the gcloud on MacOS
# ----------------------------------------------------------------------------
if [[ "$OSTYPE" == "darwin"* ]]; then
  # The next line updates PATH for the Google Cloud SDK.
  source_if_exists $HOME/google-cloud-sdk/path.bash.inc
  # The next line enables shell command completion for gcloud.
  source_if_exists $HOME/google-cloud-sdk/completion.bash.inc
fi

# source bashrc if exist
# ----------------------------------------------------------------------------
# if [ -f ~/.bashrc ]; then . ~/.bashrc; fi
source_if_exists $HOME/.bashrc

# launch starx automatically
# ----------------------------------------------------------------------------
# if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
# exec startx "$XDG_CONFIG_HOME/X11/xinitrc"
# fi

# Print if the file is sourced
# ----------------------------------------------------------------------------
echo "-- .bash_profile file sourced"
