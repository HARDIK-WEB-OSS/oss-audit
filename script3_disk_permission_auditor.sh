#!/bin/bash
# Script 3: Disk and Permission Auditor
# Author: [Your Name] | Reg No: [Your Reg No]
# Course: Open Source Software | VIT Bhopal
# Description: Loops through key Linux directories and reports
#              permissions, ownership, and disk usage for each.

# ---------------------------------------------------------------
# DIRECTORY LIST — important Linux system directories to audit
# ---------------------------------------------------------------
DIRS=("/etc" "/var/log" "/home" "/usr/bin" "/tmp" "/boot" "/usr/lib")

echo "======================================================="
echo "          Disk and Permission Auditor Report           "
echo "======================================================="
echo ""
printf "%-20s %-25s %-10s\n" "Directory" "Perms (type+owner+group)" "Size"
echo "-------------------------------------------------------"

# ---------------------------------------------------------------
# FOR LOOP — iterate over each directory and report its stats
# ---------------------------------------------------------------
for DIR in "${DIRS[@]}"; do

    if [ -d "$DIR" ]; then
        # Get permission string, owner, and group using ls and awk
        PERMS=$(ls -ld "$DIR" | awk '{print $1, $3, $4}')

        # Get human-readable size with du; suppress permission errors
        SIZE=$(du -sh "$DIR" 2>/dev/null | cut -f1)

        printf "%-20s %-25s %-10s\n" "$DIR" "$PERMS" "$SIZE"
    else
        # Directory does not exist on this system
        printf "%-20s %-35s\n" "$DIR" "[Does not exist on this system]"
    fi

done

echo ""
echo "======================================================="
echo "   Linux Kernel Config Directory Check                 "
echo "======================================================="

# ---------------------------------------------------------------
# KERNEL CONFIG CHECK — check if kernel boot config exists
# This is specific to our chosen software: the Linux Kernel
# ---------------------------------------------------------------
KERNEL_VERSION=$(uname -r)
KERNEL_CONFIG="/boot/config-$KERNEL_VERSION"

echo ""
echo "Kernel version running: $KERNEL_VERSION"
echo ""

if [ -f "$KERNEL_CONFIG" ]; then
    # Show permissions of the kernel config file
    CONFIG_PERMS=$(ls -l "$KERNEL_CONFIG" | awk '{print $1, $3, $4}')
    CONFIG_SIZE=$(du -sh "$KERNEL_CONFIG" 2>/dev/null | cut -f1)
    echo "Kernel config file    : $KERNEL_CONFIG"
    echo "Permissions           : $CONFIG_PERMS"
    echo "Size                  : $CONFIG_SIZE"
else
    echo "Kernel config file not found at: $KERNEL_CONFIG"
    echo "(WSL2 systems may store kernel config differently)"

    # Check alternate location used by some distros
    if [ -f "/proc/config.gz" ]; then
        echo "Found compressed config at: /proc/config.gz"
    else
        echo "Check /proc/version for kernel build info instead."
        cat /proc/version
    fi
fi

echo ""
echo "======================================================="
echo "  Audit complete. Open permissions on /tmp are normal."
echo "  Restricted permissions on /boot protect the kernel."
echo "======================================================="
