#!/bin/bash
# export FZF_DEFAULT_COMMAND='rg --files --no-ignore-vcs --hidden'
# export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -l -g ""'
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*"'
alias safecommit="git stash && git pull && git stash pop && git add -p"
alias fixlock="sudo rm /var/lib/apt/lists/lock && sudo rm /var/cache/apt/archives/lock && sudo rm /var/lib/dpkg/lock"
alias list_ports="sudo ss -lntu"
alias merge_into_testing="~/bash/merge-into-testing.sh"
alias update_from_staging="~/bash/update-from-staging.sh"
alias update="sudo apt update -y && sudo apt upgrade -y && sudo apt autoremove -y && sudo snap refresh"
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

### work
alias new_wuzzuf_pr="~/bash/new-wuzzuf-pr.sh"
alias wuzzuf_migration='docker exec -it docker.web-5 bash -c "cd basharjobs/.build-wuzzuf; php vendor/bin/doctrine-migrations migrations:migrate" && docker exec -it docker.web-7 bash -c "cd wuzzuf-platform && php artisan doctrine:migrations:migrate"'
alias forasna_up='~/bash/fup'
alias forasna_down='~/bash/fdown'
alias wuzzuf_up='sh ~/bash/wuzzuf-up.sh'
alias wuzzuf_down='sh ~/bash/wuzzuf-down.sh'
alias forasna_migration='docker exec -it forasna-php-dev php index.php migrations/migrate'
alias forasna_clear_cache="find application/cache/ -type f -not -name '*html' -not -name '*htaccess' -print0 | xargs -0 rm --"
alias forasna_compile_migrate='docker exec -u $USER forasna-php-dev bash -c "cd application/third_party && php -d memory_limit=6096M /bin/composer install && cd ../../ && php index.php migrations/migrate/pre && php index.php migrations/migrate"'

# Alias for floaterm in vim
alias f=floaterm
