STUDENT_NAME="Hardik Agarwal"
SOFTWARE_CHOICE="Linux Kernel"

KERNEL=$(uname -r)
USER_NAME=$(whoami)
HOME_DIR=$HOME
UPTIME=$(uptime -p)
CURRENT_DATE=$(date '+%A, %d %B %Y %H:%M:%S')

DISTRO=$(grep '^PRETTY_NAME' /etc/os-release | cut -d= -f2 | tr -d '"')

OS_LICENSE="GNU General Public License version 2 (GPL v2)"

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
