#!/bin/bash

current_branch_name=$(git symbolic-ref -q HEAD)
current_branch_name=${current_branch_name##refs/heads/}
current_branch_name=${current_branch_name:-HEAD}

git checkout testing

git pull

git merge $current_branch_name --no-edit

git push

git checkout $current_branch_name
