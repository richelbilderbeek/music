#!/bin/bash

mkdir booklet

# Extract text (in code tags)
for filename in $(ls *.md | grep -Ev "README\.md" | grep -Ev "Abc\.md")
do
  sed -n '/^```/,/^```/p' $filename > booklet/$filename
done


cd booklet || exit

# Convert all to PDF
for filename in $(ls *.md)
do
  pandoc $filename -o $(echo $filename | sed 's/\.md/.pdf/')
done

all_pdfs=$(ls *.pdf | grep -Ev "Booklet\.pdf" | grep -Ev "Book\.pdf")
pdfunite "${all_pdfs}" Book.pdf

# Make booklet
bookletimposer -a Book.pdf -o Booklet.pdf

cp Book.pdf ../Book.pdf
cp Booklet.pdf ../Booklet.pdf
