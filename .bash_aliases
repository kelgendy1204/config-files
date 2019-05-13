alias ssh_testing='ssh khaled@142.93.249.128'
alias safecommit="git stash && git pull && git stash pop && git add -p"
alias fixlock="sudo rm /var/lib/apt/lists/lock && sudo rm /var/cache/apt/archives/lock && sudo rm /var/lib/dpkg/lock"
alias list_ports="sudo netstat -peanut"
commit_push() { git commit -m "$1"; git push; }
safemerge() { git pull && git merge "$1"; git push; }
list_port() { sudo netstat -peanut | grep ":$1 " }
kill_port() { sudo fuser -n tcp -k $1 }
