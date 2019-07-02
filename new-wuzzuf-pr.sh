#!/bin/bash

token='859d1a8dc2cdf30bfc709bbb15f942d947cba06b'

read -p "Enter branch to merge: " mergedBranch
read -p "Enter base branch: " baseBranch
read -p "Enter PR title: " prTitle
read -p "Enter PR body: " prBody

curl -X POST -H "Authorization: token $token" \
    -d "{\"title\":\"$prTitle\",\"head\":\"$mergedBranch\", \"base\": \"$baseBranch\", \"body\": \"$prBody\"}" \
    https://api.github.com/repos/BasharSoft/wuzzuf-frontend/pulls
