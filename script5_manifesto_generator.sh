#!/bin/bash
# Script 5: Open Source Manifesto Generator
# Author: [Your Name] | Reg No: [Your Reg No]
# Course: Open Source Software | VIT Bhopal
# Description: Asks the user three questions interactively, then
#              composes a personalised open-source philosophy
#              statement and saves it to a .txt file.

# ---------------------------------------------------------------
# ALIAS CONCEPT (demonstrated via comment as required)
# In a real shell session you could run:
#   alias manifest='./script5_manifesto_generator.sh'
# This lets you type 'manifest' instead of the full script name.
# Aliases make long commands short — a core Linux productivity idea.
# ---------------------------------------------------------------

echo "======================================================="
echo "       Open Source Manifesto Generator                 "
echo "======================================================="
echo ""
echo "Answer three questions to generate your personal"
echo "open-source philosophy statement."
echo ""

# ---------------------------------------------------------------
# USER INPUT — read three answers interactively with read -p
# ---------------------------------------------------------------

# Question 1: A tool they use daily
read -p "1. Name one open-source tool you use every day: " TOOL

# Question 2: What freedom means to them in one word
read -p "2. In one word, what does 'freedom' mean to you? " FREEDOM

# Question 3: Something they would build and share
read -p "3. Name one thing you would build and share freely: " BUILD

# ---------------------------------------------------------------
# METADATA — capture date and username for the file
# ---------------------------------------------------------------
DATE=$(date '+%d %B %Y')           # Formatted date: 29 March 2026
AUTHOR=$(whoami)                   # Current Linux username
OUTPUT="manifesto_${AUTHOR}.txt"   # Output filename includes username

# ---------------------------------------------------------------
# STRING CONCATENATION — build the manifesto paragraph
# We use echo with >> to append each line to the output file
# > creates/overwrites the file; >> appends to it
# ---------------------------------------------------------------

# Create the file fresh (overwrite if it already exists)
echo "=======================================================" > "$OUTPUT"
echo "         MY OPEN SOURCE MANIFESTO                      " >> "$OUTPUT"
echo "=======================================================" >> "$OUTPUT"
echo "" >> "$OUTPUT"
echo "Author : $AUTHOR" >> "$OUTPUT"
echo "Date   : $DATE" >> "$OUTPUT"
echo "" >> "$OUTPUT"
echo "-------------------------------------------------------" >> "$OUTPUT"

# Compose the personalised philosophy paragraph
echo "" >> "$OUTPUT"
echo "Every day, I rely on $TOOL — a piece of software built" >> "$OUTPUT"
echo "not for profit, but for the shared good of anyone who" >> "$OUTPUT"
echo "needs it. To me, freedom means $FREEDOM. That single word" >> "$OUTPUT"
echo "captures what the open-source movement is really about:" >> "$OUTPUT"
echo "the freedom to read the code that shapes your world," >> "$OUTPUT"
echo "the freedom to change it when it is broken, and the" >> "$OUTPUT"
echo "freedom to pass it on without restriction." >> "$OUTPUT"
echo "" >> "$OUTPUT"
echo "The Linux Kernel — the software at the heart of this audit" >> "$OUTPUT"
echo "— was not created for commercial gain. Linus Torvalds" >> "$OUTPUT"
echo "shared it because he believed that knowledge grows when" >> "$OUTPUT"
echo "it is shared, not when it is locked away. I carry that" >> "$OUTPUT"
echo "belief forward. Given the chance, I would build $BUILD" >> "$OUTPUT"
echo "and release it under an open license — so that someone" >> "$OUTPUT"
echo "I will never meet can learn from it, improve it, and" >> "$OUTPUT"
echo "build something greater still." >> "$OUTPUT"
echo "" >> "$OUTPUT"
echo "Open source is not just a licensing model." >> "$OUTPUT"
echo "It is an argument about how the world should work." >> "$OUTPUT"
echo "" >> "$OUTPUT"
echo "-------------------------------------------------------" >> "$OUTPUT"
echo "Signed: $AUTHOR | $DATE" >> "$OUTPUT"
echo "=======================================================" >> "$OUTPUT"

# ---------------------------------------------------------------
# OUTPUT — confirm save location and print the manifesto
# ---------------------------------------------------------------
echo ""
echo "-------------------------------------------------------"
echo " Manifesto saved to: $OUTPUT"
echo "-------------------------------------------------------"
echo ""

# Print the saved file to the terminal
cat "$OUTPUT"
