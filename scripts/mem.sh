#!bash
free --mega | awk '/^Mem:/ {printf "MEM: %.1fGB/%.1fGB\n", $3/1024, $2/1024}'
