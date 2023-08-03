all: 01_maanliedje.png

# Adapted from https://stackoverflow.com/a/53180170 (where a PDF was created):
#
# Add
#
#   <policy domain="coder" rights="read | write" pattern="PS" />
#
# just before </policymap> in /etc/ImageMagick-6/policy.xml
01_maanliedje.png: 01_maanliedje.abc
	abcm2ps 01_maanliedje.abc
	convert -density 150 Out.ps -trim 01_maanliedje.png
