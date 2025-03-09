#!/bin/bash

if [ -e music.tex ]; then rm music.tex; fi
if [ -e music.epub ]; then rm music.epub; fi

cat Discography.md | egrep "^[[:digit:]]" | egrep -o "\[.*\]" | egrep -o "[A-Za-z0-9\. ]*" | sed 's/^/ * /' > music.md

echo "# Discography" > music2.md
echo " " >> music2.md
cat music.md >> music2.md
mv music2.md music.md

pandoc music.md -o music.tex

cat music.tex | sed 's/\\label{discography}//' > music2.tex
mv music2.tex music.tex


cat music.tex | sed 's/\\tightlist//' > music2.tex
mv music2.tex music.tex

echo "\documentclass{article}" > music2.tex
echo " " >> music2.tex
echo "\begin{document}" >> music2.tex
echo " " >> music2.tex
cat music.tex >> music2.tex
echo " " >> music2.tex

# NOT: echo "\end{document}" >> music2.tex
printf '\end{document}' >> music2.tex

mv music2.tex music.tex






tex4ebook music.tex
