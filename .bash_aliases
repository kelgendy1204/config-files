#!/bin/bash
# export FZF_DEFAULT_COMMAND='rg --files --no-ignore-vcs --hidden'
# export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -l -g ""'
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*"'
alias safecommit="git stash && git pull && git stash pop && git add -p"
alias fixlock="sudo rm /var/lib/apt/lists/lock && sudo rm /var/cache/apt/archives/lock && sudo rm /var/lib/dpkg/lock"
alias list_ports="sudo ss -lntu"
alias myip="curl http://ipecho.net/plain; echo"
alias bye="sudo shutdown now"
alias rsync="rsync -avhP"

commit_push() {
    git commit -m "$1"
    git push
}

safemerge() {
    git pull && git merge "$1"
    git push
}

list_port() {
    sudo ss -lntu | grep ":$1 "
}

kill_port() {
    sudo fuser -n tcp -k "$1"
}

# Alias for floaterm in vim
alias f=floaterm
