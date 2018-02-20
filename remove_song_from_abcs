#!/bin/bash

# Convert all Song*.html to *.md

for filename in `ls Song*.* | sort`
do
  echo $filename
  to=`echo $filename | sed 's/^Song//'`
  echo $to
  mv $filename $to
done