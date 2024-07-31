#!/bin/bash

# find all type directories from $HOME and choose where to cd next
# fd -i for enabling case-sensitive
fzf_go_to_path() {
    cd "$(fd -td -H -i . $HOME | fzf)" &&
    eza --color=always --icons=always --long --all --group-directories-first --git
}

fzf_go_to_path()
