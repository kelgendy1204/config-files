#!/bin/bash
if [[ "$(uname)" == "Darwin" ]]; then
    total_bytes=$(sysctl -n hw.memsize)
    total_gb=$(echo "scale=1; $total_bytes / 1073741824" | bc)
    page_size=$(vm_stat | awk '/page size/ {print $8}')
    used_pages=$(vm_stat | awk '/Pages active/ {gsub(/\./,""); print $3}')
    used_gb=$(echo "scale=1; $used_pages * $page_size / 1073741824" | bc)
    echo "MEM: ${used_gb}GB/${total_gb}GB"
else
    free --mega | awk '/^Mem:/ {printf "MEM: %.1fGB/%.1fGB\n", $3/1024, $2/1024}'
fi
