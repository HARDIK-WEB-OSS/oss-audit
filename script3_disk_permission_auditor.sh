DIRS=("/etc" "/var/log" "/home" "/usr/bin" "/tmp" "/boot" "/usr/lib")

echo "======================================================="
echo "          Disk and Permission Auditor Report           "
echo "======================================================="
echo ""
printf "%-20s %-25s %-10s\n" "Directory" "Perms (type+owner+group)" "Size"
echo "-------------------------------------------------------"

for DIR in "${DIRS[@]}"; do

    if [ -d "$DIR" ]; then
        PERMS=$(ls -ld "$DIR" | awk '{print $1, $3, $4}')
        SIZE=$(du -sh "$DIR" 2>/dev/null | cut -f1)
        printf "%-20s %-25s %-10s\n" "$DIR" "$PERMS" "$SIZE"

    else
        printf "%-20s %-35s\n" "$DIR" "[Does not exist on this system]"
    fi

done

echo ""
echo "======================================================="
echo "   Linux Kernel Config Directory Check                 "
echo "======================================================="

KERNEL_VERSION=$(uname -r)
KERNEL_CONFIG="/boot/config-$KERNEL_VERSION"

echo ""
echo "Kernel version running: $KERNEL_VERSION"
echo ""

if [ -f "$KERNEL_CONFIG" ]; then
    CONFIG_PERMS=$(ls -l "$KERNEL_CONFIG" | awk '{print $1, $3, $4}')
    CONFIG_SIZE=$(du -sh "$KERNEL_CONFIG" 2>/dev/null | cut -f1)
    echo "Kernel config file    : $KERNEL_CONFIG"
    echo "Permissions           : $CONFIG_PERMS"
    echo "Size                  : $CONFIG_SIZE"
else
    echo "Kernel config file not found at: $KERNEL_CONFIG"
    echo "(WSL2 systems may store kernel config differently)"
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
