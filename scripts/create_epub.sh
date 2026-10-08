#!/bin/bash

if [ -e music.tex ]; then rm music.tex; fi
if [ -e music.epub ]; then rm music.epub; fi

cat Discography.md | grep -E "^[[:digit:]]" | grep -Eo "\[.*\]" | grep -Eo "[A-Za-z0-9\. ]*" | sed 's/^/ * /' > music.md

echo "# Discography" > music2.md
echo " " >> music2.md
cat music.md >> music2.md
mv music2.md music.md

pandoc music.md -o music.tex

(sed 's/\\label{discography}//' < music.tex) > music2.tex
mv music2.tex music.tex


(sed 's/\\tightlist//' < music.tex) > music2.tex
mv music2.tex music.tex

{
  printf '\documentclass{article}'
  echo " "
  printf '\begin{document}'
  echo " "
  cat music.tex
  echo " "
  printf '\end{document}'
} > music2.tex
 
mv music2.tex music.tex






tex4ebook music.tex
