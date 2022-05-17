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
alias change="cd ~ && cd \$(find * -type d | fzf)"

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

get_weather() {
    local city="${1:-"hilden"}"
    curl "https://wttr.in/$city"
}

update_branch() {
    local branch="${1:-"main"}"
    echo $branch
    git checkout "$branch"
    git pull
    git checkout -
    git merge "$branch"
}

alias vpnconnect="nordvpn connect"
alias vpndisconnect="nordvpn disconnect"
alias vpnkillswitch="nordvpn set killswitch"
