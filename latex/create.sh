#!/bin/bash
#
# Create the PDF 'boost_graph_cookbook_1.pdf'
#
# It does so by converting the TeX to PDF, 
# as well as stitching some other PDFs to it
#
# Usage:
#
#   ./create.sh
#
./clean.sh
pdflatex music.tex
pdflatex music.tex
./view.sh
