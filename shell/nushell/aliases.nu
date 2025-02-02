# -----------------------------------------------------
# EASIER NAVIGATION
# -----------------------------------------------------

alias .. = cd ..
alias ... = cd ../../ 
alias .... = cd ../../../ 
alias ..... = cd ../../../../ 
alias c = clear 
alias ssd = sudo shutdown now
alias sr = sudo reboot

# with -i it is asking you if overwrites something
# with -v it explains what is being done on terminal
# with -p you are making the parent directory if doesnt exist
alias mkdir = mkdir -v
# alias rmd='rm -rfv'
alias rm = rm -iv
alias mv = mv -iv  
alias cp = cp -iv
alias ln = ln -i

# replace cat with bat, but preserve cat's default behavior
alias cat = bat --paging=never
alias b = bash 
alias e = exit 
# echo PATH, every path in different line
alias ep = echo $env.PATH | tr : "\n" 
# Recursively delete `.DS_Store` files
# alias cleanup = find . -type f -name '*.DS_Store' -ls -delete

# -----------------------------------------------------
# LINUX SCRIPTS
# -----------------------------------------------------

# source bash files and clear terminal
alias sb = source_files
# combine cd with eza
alias cdd = cd_with_eza
# run weekly updates, checks and clean up
alias ue = update_everything.py

# -----------------------------------------------------
# FZF SCRIPTS
# -----------------------------------------------------

# find a directory with fzf and go there, works only with bash
# z() {
#     local dir
#     dir=$(fzf_go_to_path.sh)
#     if [ -n "$dir" ]; then
#         cd "$dir" && eza --color=always --icons=always --long --all --group-directories-first --git
#     else
#         echo "No directory selected."
#     fi
# }
# find a file with fzf and open it with nvim
alias vv = fzf_util.py --open_file
# find empty files
alias fe = fzf_util.py --empty_files
# find files bigger than xxxMB
alias fb = fzf_util.py --big_files
# find all the scripts i have
alias fs = fzf_util.py --find_scripts
# move a file from anywhere folder to anywhere folder
alias fm = fzf_util.py --move_file
# copy file to anywhere
alias fc = fzf_util.py --copy_file
# find a phrase in a file
alias ff = fzf_util.py --file_phrase

# -----------------------------------------------------
# PYTHON
# -----------------------------------------------------

alias p3 = python3
alias p = python_execute_script.py
alias pipv = uv pip list | fzf 
alias pu = python_pip_update.py -S
alias pua = python_pip_update.py -A 
alias pic = python_init_code.py
# alias a = activate-venv
alias a = bash -c ". ~/uv_default/bin/activate && nu"
alias d = deactivate 

# eza shortcuts
# https://github.com/eza-community/eza
# sort by name first, directory first, no info
# alias l='eza --color=always --icons=always --long --all --group-directories-first --git --no-permissions --no-filesize --no-time --no-user'
# sort by name first, directory first, with info
# alias ll='eza --color=always --icons=always --long --all --group-directories-first --git'
# sort directory first, sort by size
# alias lls='eza --color=always --icons=always --long --all --group-directories-first --total-size --sort=size --reverse'
# sort by size name, long format
# alias lll='eza --color=always --icons=always --long -all'

# trashy shortcuts
# https://github.com/oberblastmeister/trashy
# use trash with 'rmd'
alias rmd = trash
# trash list
alias trl = trash list
# empty all items from trash
alias tra = trash empty --all
# restore trash item with trashy
alias trr = fzf_util.py --restore_file
# empty trash item with trashy
alias tre = fzf_util.py --empty_trash

# yazi shortcuts
# https://github.com/sxyazi/yazi
# use the below function so yazi can change directory
# function yy() {
# 	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
# 	yazi "$@" --cwd-file="$tmp"
# 	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
# 		cd -- "$cwd"
# 	fi
# 	rm -f -- "$tmp"
# }

# -----------------------------------------------------
# GIT SHORTCUTS
# -----------------------------------------------------

alias ginit = git_util.py --init_template
alias gpu = git push
alias gpl = git pull
alias ga = git add
alias gall = git add -A
alias gc = git commit
alias gcm = git commit -m
alias gcw = git_util.py --commit_workflow
alias gl = git log
alias glo = git log --oneline
alias glg = git_util.py --log_graph
alias gpulla = git_util.py --pull_all_dirs
alias gpusha = git_util.py --push_all_dirs
alias gac = git_util.py --auto_commit
# amend a commit without changing the commit message
alias gcame = git commit --amend --no-edit
# working directory removes all changes and goes back to the latest commit
alias gcheck = git checkout .
alias gs = git status -sb
alias gsa = git_util.py --status_all_dirs
# clean up ignore files that mistakenly are tracked
alias gclean = git_util.py --clean_up
alias gd = git diff -w

# -----------------------------------------------------
# PRINT FILE SOURCED CONFIRMATION
# -----------------------------------------------------

echo "-- .aliases file sourced"
