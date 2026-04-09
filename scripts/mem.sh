#!/bin/bash
if [[ "$(uname)" == "Darwin" ]]; then
    vm_stat | awk '
        /page size/                    {page=$8}
        /Pages active/                 {gsub(/\./,""); active=$3}
        /Pages inactive/               {gsub(/\./,""); inactive=$3}
        /Pages speculative/            {gsub(/\./,""); speculative=$3}
        /Pages wired down/             {gsub(/\./,""); wired=$4}
        /Pages occupied by compressor/ {gsub(/\./,""); compressed=$5}
        /Pages purgeable/              {gsub(/\./,""); purgeable=$3}
        /File-backed pages/            {gsub(/\./,""); filebacked=$3}
        /hw.memsize/                   {total_bytes=$2}
        END {
            used = (active+inactive+speculative+wired+compressed-filebacked-purgeable)*page
            cmd = "sysctl -n hw.memsize"
            cmd | getline total_bytes
            close(cmd)
            printf "MEM: %.1fGB/%.1fGB\n", used/1073741824, total_bytes/1073741824
        }
    '
else
    free -b | awk '/^Mem:/ {printf "MEM: %.1fGB/%.1fGB\n", $3/1073741824, $2/1073741824}'
fi
