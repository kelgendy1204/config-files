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
alias tat="~/profile-scripts/tat.sh"

commit_push() {
    git commit -m "$1"
    git push
}

commit_push_no_check() {
    git commit -m "$1" -n
    git push
}

unzip_tar() {
    local file_path="${1}"
    if [ -z "$file_path" ]; then
        echo "Error: file path is missing."
        return 1
    fi
    tar zxvf "$file_path"
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

update_branch() {
    local branch="${1:-"main"}"
    echo $branch
    git checkout "$branch"
    git pull
    git checkout -
    git merge "$branch"
}

function ssh-add-key() {
    eval "$(ssh-agent -s)"
    ssh-add "$1"
}

alias pr_view="gh pr view --web"
alias pr_checks="gh pr checks"
alias pr_diff="gh pr diff"
alias pr_create="gh pr create --web"
alias repo_view="gh repo view --web"
pr_checkout() {
    local pr_no="${1}"
    if [ -z "$pr_no" ]; then
        echo "Error: PR number is missing."
        return 1
    fi
    gh pr checkout "$pr_no"
}

alias nordvpnconnect="nordvpn connect"
alias nordvpndisconnect="nordvpn disconnect"
alias nordvpnkillswitch="nordvpn set killswitch"

alias openvpnmanage="openvpn3 session-manage --config ~/Dropbox/linux.ovpn"
alias openvpnconnect="openvpn3 session-start --config ~/Dropbox/linux.ovpn"
alias openvpndisconnect="openvpn3 session-manage --config ~/Dropbox/linux.ovpn --disconnect"
alias openvpnresume="openvpn3 session-manage --config ~/Dropbox/linux.ovpn --resume"
alias openvpnpause="openvpn3 session-manage --config ~/Dropbox/linux.ovpn --pause"

if [[ $TMUX ]]; then
  alias clear='clear && tmux clear-history'
fi
