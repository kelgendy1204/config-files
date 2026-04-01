#!/bin/bash
if [[ "$(uname)" == "Darwin" ]]; then
    cpu=$(top -l1 -n0 | awk '/^CPU usage/ {gsub(/%/,""); print $3}')
else
    cpu=$(top -bn1 | awk '/^%Cpu/ {print $2}')
fi
echo "CPU: ${cpu}%"
