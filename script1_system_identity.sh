#!/bin/bash
# Script 1: System Identity Report
# Author: [Your Name] | Reg No: [Your Reg No]
# Course: Open Source Software | VIT Bhopal
# Description: Displays a system welcome screen with OS info,
#              user details, uptime, and open-source license info.

# ---------------------------------------------------------------
# VARIABLES — store student info and system data
# ---------------------------------------------------------------
STUDENT_NAME="[Your Name]"          # Replace with your name
SOFTWARE_CHOICE="Linux Kernel"      # Chosen OSS project

KERNEL=$(uname -r)                          # Current kernel version
USER_NAME=$(whoami)                         # Logged-in username
HOME_DIR=$HOME                              # Home directory path
UPTIME=$(uptime -p)                         # Human-readable uptime
CURRENT_DATE=$(date '+%A, %d %B %Y %H:%M:%S')  # Current date and time

# Get Linux distro name from /etc/os-release file
DISTRO=$(grep '^PRETTY_NAME' /etc/os-release | cut -d= -f2 | tr -d '"')

# The Linux Kernel is licensed under GPL v2
OS_LICENSE="GNU General Public License version 2 (GPL v2)"

# ---------------------------------------------------------------
# DISPLAY — print formatted system identity report
# ---------------------------------------------------------------
echo "======================================================="
echo "        Open Source Audit — System Identity Report     "
echo "======================================================="
echo ""
echo "  Student   : $STUDENT_NAME"
echo "  Project   : $SOFTWARE_CHOICE Audit"
echo "-------------------------------------------------------"
echo "  OS        : $DISTRO"
echo "  Kernel    : $KERNEL"
echo "  User      : $USER_NAME"
echo "  Home Dir  : $HOME_DIR"
echo "  Uptime    : $UPTIME"
echo "  Date/Time : $CURRENT_DATE"
echo "-------------------------------------------------------"
echo "  License   : $OS_LICENSE"
echo ""
echo "  The Linux Kernel is free software. You have the"
echo "  freedom to run, study, modify, and redistribute it."
echo "======================================================="
