#!/bin/bash
# Script 4: Log File Analyzer
# Author: [Your Name] | Reg No: [Your Reg No]
# Course: Open Source Software | VIT Bhopal
# Description: Reads a log file line by line, counts lines matching
#              a keyword, and prints a summary with last 5 matches.
# Usage: ./script4_log_analyzer.sh <logfile> [keyword]
# Example: ./script4_log_analyzer.sh /var/log/dpkg.log error

# ---------------------------------------------------------------
# ARGUMENTS — accept log file path and optional keyword
# ---------------------------------------------------------------
LOGFILE=$1                   # First argument: path to log file
KEYWORD=${2:-"error"}        # Second argument: keyword (default: error)
COUNT=0                      # Counter for matching lines

# ---------------------------------------------------------------
# VALIDATION — check that a file path was actually provided
# ---------------------------------------------------------------
if [ -z "$LOGFILE" ]; then
    echo "Usage: $0 <logfile> [keyword]"
    echo "Example: $0 /var/log/dpkg.log install"
    exit 1
fi

# ---------------------------------------------------------------
# RETRY LOOP — if file doesn't exist, ask user to re-enter path
# This simulates a do-while retry pattern in bash
# ---------------------------------------------------------------
ATTEMPTS=0
MAX_ATTEMPTS=3

while [ ! -f "$LOGFILE" ]; do
    ATTEMPTS=$((ATTEMPTS + 1))

    # Exit after too many failed attempts
    if [ $ATTEMPTS -ge $MAX_ATTEMPTS ]; then
        echo "Error: Could not find a valid log file after $MAX_ATTEMPTS attempts. Exiting."
        exit 1
    fi

    echo "Error: File '$LOGFILE' not found. (Attempt $ATTEMPTS of $MAX_ATTEMPTS)"
    read -p "Enter a valid log file path: " LOGFILE
done

# ---------------------------------------------------------------
# EMPTY FILE CHECK — warn user if the log file has no content
# ---------------------------------------------------------------
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

# ---------------------------------------------------------------
# WHILE READ LOOP — read the file one line at a time
# IFS= preserves whitespace; -r prevents backslash interpretation
# ---------------------------------------------------------------
while IFS= read -r LINE; do

    # Case-insensitive search for keyword in current line
    if echo "$LINE" | grep -iq "$KEYWORD"; then
        COUNT=$((COUNT + 1))   # Increment counter on match
    fi

done < "$LOGFILE"   # Feed the file into the while loop

# ---------------------------------------------------------------
# SUMMARY — print total count of keyword matches
# ---------------------------------------------------------------
echo ""
echo "  Keyword '$KEYWORD' found : $COUNT times"
echo ""

# ---------------------------------------------------------------
# LAST 5 MATCHES — show the most recent matching lines
# grep -i = case insensitive | tail -5 = last 5 results
# ---------------------------------------------------------------
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
