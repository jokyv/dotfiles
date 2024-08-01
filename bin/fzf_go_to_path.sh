#! /bin/bash

# find all type directories from $HOME and choose where to cd next
# fd -i for enabling case-sensitive
# fzf_go_to_path() {
#     cd "$(fd -td -H -i . $HOME | fzf)" &&
#     eza --color=always --icons=always --long --all --group-directories-first --git
# }

fzf_go_to_path() {
    local chosen_dir
    chosen_dir=$(fd -td -H -i . $HOME | fzf) && 
    cd "$chosen_dir" &&
    eza --color=always --icons=always --long --all --group-directories-first --git &&
    cd "$chosen_dir"
} 

fzf_go_to_path
