#!/bin/bash

# Get total memory in MB from /proc/meminfo
total_mem_mb=$(awk '/MemTotal/ { print int($2 / 1024) }' /proc/meminfo)

# Define acceptable bounds (in MB)
lower_bound=500
upper_bound=1229

# Base64-encoded secret word ("toast")
encoded="dG9hc3Q="

if [ "$total_mem_mb" -ge "$lower_bound" ] && [ "$total_mem_mb" -le "$upper_bound" ]; then
    echo -n "The secret word is: "
    echo "$encoded" | base64 --decode
    echo ""
else
    echo "To complete this challenge, the VM's memory must be set to 1GB (or 1024 MB)."
    echo "This VM currently has more than 1GB of memory."
fi
