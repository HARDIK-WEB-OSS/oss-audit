PACKAGES=("git" "python3" "apache2" "vlc")

echo "======================================================="
echo "         FOSS Package Inspector Report                 "
echo "======================================================="
echo ""

for PACKAGE in "${PACKAGES[@]}"; do

    echo "-------------------------------------------------------"
    echo "Package: $PACKAGE"

    if dpkg -l "$PACKAGE" &>/dev/null; then
        echo "Status  : INSTALLED"

        VERSION=$(dpkg -l "$PACKAGE" 2>/dev/null | grep "^ii" | awk '{print $3}')
        echo "Version : $VERSION"

    else
        echo "Status  : NOT INSTALLED"
        echo "Tip     : Run -> sudo apt install $PACKAGE"
    fi

    case $PACKAGE in
        git)
            echo "Note    : Git — Linus Torvalds built it when proprietary"
            echo "          version control failed him. Freedom to branch."
            ;;
        python3)
            echo "Note    : Python — shaped entirely by community consensus."
            echo "          A language that belongs to everyone."
            ;;
        apache2)
            echo "Note    : Apache — the open web server that proved"
            echo "          community collaboration beats corporate control."
            ;;
        vlc)
            echo "Note    : VLC — students in Paris built it because no free"
            echo "          tool existed. LGPL means anyone can adapt it."
            ;;
        linux-image*)
            echo "Note    : Linux Kernel — the foundation everything runs on."
            echo "          GPL v2 ensures it stays free, forever."
            ;;
        *)
            echo "Note    : An open-source tool contributing to a free world."
            ;;
    esac

    echo ""
done

echo "======================================================="
echo "  Kernel currently running this system:"
uname -r
echo "  License: GPL v2 — source code must always stay open."
echo "======================================================="
