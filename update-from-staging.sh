#!/bin/bash

current_branch_name=$(git symbolic-ref -q HEAD)
current_branch_name=${current_branch_name##refs/heads/}
current_branch_name=${current_branch_name:-HEAD}

git checkout staging

git pull

git checkout $current_branch_name

git merge staging --no-edit

git push
