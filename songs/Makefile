# all: 01_maanliedje.png


ABCS := $(wildcard *.abc)
PNGS := $(ABCS:%.abc=%.png)

all: ${PNGS}

.PHONY = all

# Adapted from https://stackoverflow.com/a/53180170 (where a PDF was created):
#
# Add
#
#   <policy domain="coder" rights="read | write" pattern="PS" />
#
# just before </policymap> in /etc/ImageMagick-6/policy.xml
#
# When the target PNG already exists, it will be deleted, because
#   (1) For a single-page sheet music: 
#       ImageMagick (`convert`) must overwrite it
#   (2) For a multi-page sheet music: 
#       the combined/target PNG will only be created 
#       when the target file does not exists.
#
%.png: %.abc
	abcm2ps $<
	[ -f $@ ] && rm $@
	convert -density 150 Out.ps -trim $@
	[ ! -f $@ ] && montage -mode concatenate -tile 1x $(basename $@)-*.png $@



#01_maanliedje.png: 01_maanliedje.abc
#	abcm2ps 01_maanliedje.abc
#	convert -density 150 Out.ps -trim 01_maanliedje.png
