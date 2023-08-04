# all: 01_maanliedje.png


ABCS := $(wildcard *.abc)
PNGS := $(ABCS:%.abc=%.png)
MIDIS := $(ABCS:%.abc=%.mid)
WAVS := $(ABCS:%.abc=%.wav)
OGGS := $(ABCS:%.abc=%.ogg)

all: ${PNGS} ${MIDIS} ${WAVS} ${OGGS}

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
	rm -f $@
	abcm2ps $<
	convert -density 150 Out.ps -trim $@
	[ ! -f $@ ] && montage -mode concatenate -tile 1x $(basename $@)-*.png $@

%.mid: %.abc
	abc2midi $< -o $@

%.wav: %.mid %.conf
	perl ../../ecantorix/ecantorix.pl -O wav -o $@ $<

#%.ogg: %.wav
#	avconv -i $< $@

clean:
	rm -f _default_*.pitch
	rm -f _default_*.wav
	rm -f Out.ps
	rm -rf tmp
