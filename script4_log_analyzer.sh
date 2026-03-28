LOGFILE=$1
KEYWORD=${2:-"error"}
COUNT=0

if [ -z "$LOGFILE" ]; then
    echo "Usage: $0 <logfile> [keyword]"
    echo "Example: $0 /var/log/dpkg.log install"
    exit 1
fi

ATTEMPTS=0
MAX_ATTEMPTS=3

while [ ! -f "$LOGFILE" ]; do
    ATTEMPTS=$((ATTEMPTS + 1))

    if [ $ATTEMPTS -ge $MAX_ATTEMPTS ]; then
        echo "Error: Could not find a valid log file after $MAX_ATTEMPTS attempts. Exiting."
        exit 1
    fi

    echo "Error: File '$LOGFILE' not found. (Attempt $ATTEMPTS of $MAX_ATTEMPTS)"
    read -p "Enter a valid log file path: " LOGFILE
done

if [ ! -s "$LOGFILE" ]; then
    echo "Warning: '$LOGFILE' exists but is empty. Nothing to analyze."
    exit 0
fi

echo "======================================================="
echo "             Log File Analyzer Report                  "
echo "======================================================="
echo "  File    : $LOGFILE"
echo "  Keyword : $KEYWORD"
echo "-------------------------------------------------------"


while IFS= read -r LINE; do

    if echo "$LINE" | grep -iq "$KEYWORD"; then
        COUNT=$((COUNT + 1))
    fi

done < "$LOGFILE"

echo ""
echo "  Keyword '$KEYWORD' found : $COUNT times"
echo ""

if [ $COUNT -gt 0 ]; then
    echo "-------------------------------------------------------"
    echo "  Last 5 lines containing '$KEYWORD':"
    echo "-------------------------------------------------------"
    grep -i "$KEYWORD" "$LOGFILE" | tail -5
else
    echo "  No lines matched keyword '$KEYWORD' in this file."
fi

echo ""
echo "======================================================="
echo "  Analysis complete."
echo "======================================================="
