echo "======================================================="
echo "       Open Source Manifesto Generator                 "
echo "======================================================="
echo ""
echo "Answer three questions to generate your personal"
echo "open-source philosophy statement."
echo ""

read -p "1. Name one open-source tool you use every day: " TOOL

read -p "2. In one word, what does 'freedom' mean to you? " FREEDOM

read -p "3. Name one thing you would build and share freely: " BUILD

DATE=$(date '+%d %B %Y')
AUTHOR=$(whoami)
OUTPUT="manifesto_${AUTHOR}.txt"

echo "=======================================================" > "$OUTPUT"
echo "         MY OPEN SOURCE MANIFESTO                      " >> "$OUTPUT"
echo "=======================================================" >> "$OUTPUT"
echo "" >> "$OUTPUT"
echo "Author : $AUTHOR" >> "$OUTPUT"
echo "Date   : $DATE" >> "$OUTPUT"
echo "" >> "$OUTPUT"
echo "-------------------------------------------------------" >> "$OUTPUT"

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

echo ""
echo "-------------------------------------------------------"
echo " Manifesto saved to: $OUTPUT"
echo "-------------------------------------------------------"
echo ""

cat "$OUTPUT"
