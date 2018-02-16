#!/bin/bash

# Convert all Song*.html to *.md

for filename in `ls Song*.htm | sort`
do
  to=`echo $filename | sed 's/^Song//' | sed 's/\.htm$/.md/'`
  echo $to
  pandoc $filename -o $to
done