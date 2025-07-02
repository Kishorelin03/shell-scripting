#!/bin/bash

# Timestamped output file
timestamp=$(date +%Y-%m-%d_%H-%M-%S)
output_file="system_info_$timestamp.log"

# Collect system info and save to file
{
    echo "Hostname: $(hostname)"
    echo "Uptime: $(uptime)"
    echo "Date: $(date)"
    echo ""

    echo "CPU Load Average:"
    sysctl -n vm.loadavg
    echo ""

    echo "Memory Usage (Pages):"
    vm_stat
    echo ""

    echo "Disk Usage:"
    df -h
    echo ""

    echo "Logged-in Users:"
    who
    echo ""

    echo "IP Address:"
    ipconfig getifaddr en0 2>/dev/null || ipconfig getifaddr en1
} > "$output_file"

# Let user know
echo "System information saved to: $output_file"

