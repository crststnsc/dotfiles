#!/bin/bash
# Script to display available space with decimal precision and correct units

mount_point="/"

# Get available space in human-readable format with one decimal place
available_space=$(df -h --output=avail $mount_point | awk 'NR==2')

# Extract the numeric value and the unit separately
value=$(echo $available_space | sed 's/[^0-9.]//g')
unit=$(echo $available_space | sed 's/[0-9.]//g')

# Format the output with one decimal place and append 'B' to single character units (K, M, G, T)
case $unit in
    K|M|G|T)
        unit="${unit}B"
        ;;
esac

# Combine the formatted value and unit
formatted_space=$(printf "%.1f%s\n" $value $unit)

echo $formatted_space

