alias ssh_testing='ssh khaled@142.93.249.128'
alias safecommit="git stash && git pull && git stash pop && git add -p"
alias fixlock="sudo rm /var/lib/apt/lists/lock && sudo rm /var/cache/apt/archives/lock && sudo rm /var/lib/dpkg/lock"
alias list_ports="sudo netstat -peanut"
commit_push() { git commit -m "$1"; git push; }
safemerge() { git pull && git merge "$1"; git push; }
list_port() { sudo netstat -peanut | grep ":$1 " }
kill_port() { sudo fuser -n tcp -k $1 }

alias forasna_migration='docker exec -it forasna-php php index.php migrations/migrate'
alias wuzzuf_migration='docker exec -it docker.web-5 bash -c "cd wuzzuf/.build-wuzzuf; php vendor/bin/doctrine-migrations migrations:migrate" && docker exec -it docker.web-7 bash -c "cd wuzzuf-platform && php artisan doctrine:migrations:migrate"'
alias fup='sh ~/bash/fup'
alias fdown='sh ~/bash/fdown'
alias new_wuzzuf_pr="~/bash/new-wuzzuf-pr.sh"
alias merge_into_testing="~/bash/merge-into-testing.sh"
