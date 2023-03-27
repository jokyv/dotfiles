#!/bin/bash

# find a string in a file
# needs ripgrep
fzf_file_that_contains_phrase() {
    phrase=$1
    rg $phrase -l | 
    fzf --preview "bat --style=numbers --color=always {}" |
    xargs -r $EDITOR ;
}

# find files and folders above 50MB
fzf_find_big_files() {
    fd -H . $HOME --size +50MB | fzf
}

# find empty files
fzf_empty_files() {
    fd -te -H . $HOME | fzf
}

# find all folders from $HOME and choose whre to cd next
fzf_go_to_path() {
    cd
    cd "$(fd -td -H . $HOME | fzf)" &&
    et
    # exa -hT --tree --level=2 --sort=ext
}

# find all folders from $HOME and choose where to mv next
fzf_move_to_path() {
    mv -iv $(fd -tf -H . $HOME | fzf) $(fd -td -H . $HOME | fzf) 
}

# find all folders from $HOME and choose where to cp next
fzf_copy_to_path() {
    cp -iv $(fd -tf -H . $HOME | fzf) $(fd -td -H . $HOME | fzf) 
}

# find all files from $HOME and opens them with nvim
fzf_open_file() {
    fd -tf -H . $HOME | 
    fzf --preview "bat --style=numbers --color=always {}" |
    xargs -r $EDITOR ;
}

# find all my scripts, choose one with fzf and open with nvim
fzf_find_my_scripts() {
    fd -tf . $HOME/dot/scripts/ | 
    fzf --preview "bat --style=numbers --color=always {}" | 
    xargs -r $EDITOR ;
}

# restore trash item with trashy
fzf_restore_file_from_trash() {
    trash list |
    fzf --multi |
    awk '{$1=$1;print}' | 
    rev | 
    cut -d ' ' -f1 | 
    rev | 
    xargs trash restore --match=exact --force
}

# empty trash item with trashy
fzf_empty_file_from_trash() {
    trash list | 
    fzf --multi |
    awk '{$1=$1;print}' | 
    rev | 
    cut -d ' ' -f1 | 
    rev | 
    xargs trash empty --match=exact --force
}
