MAKEJVF  = makejvf
MAKEJVFT = $(MAKEJVF) -m
PLTOTF   = ppltotf -kanji=jis

all: tfm vf

tfm:
	for fnt in min goth nmin ngoth tmin tgoth ; do \
		for size in 10 9 8 7 6 5 ; do \
			$(PLTOTF) $$fnt$$size.pl $$fnt$$size.tfm ; \
		done ; \
	done ; \
	for fnt in jis jisn jis-v jisn-v ; do \
		$(PLTOTF) $$fnt.pl $$fnt.tfm ; \
	done ;
	cp jis.tfm jisg.tfm
	cp jisn.tfm jisgn.tfm
	cp jis-v.tfm jisg-v.tfm
	cp jisn-v.tfm jisgn-v.tfm

vf:
	for fnt in min nmin ; do \
		for size in 10 9 8 7 6 5 ; do \
			$(MAKEJVF) $$fnt$$size rml ; \
		done ; \
	done ; \
	for fnt in tmin ; do \
		for size in 10 9 8 7 6 5 ; do \
			$(MAKEJVFT) $$fnt$$size rmlv ; \
		done ; \
	done ; \
	for fnt in goth ngoth ; do \
		for size in 10 9 8 7 6 5 ; do \
			$(MAKEJVF) $$fnt$$size gbm ; \
		done ; \
	done ; \
	for fnt in tgoth ; do \
		for size in 10 9 8 7 6 5 ; do \
			$(MAKEJVFT) $$fnt$$size gbmv ; \
		done ; \
	done ; \
	for fnt in jis jisn ; do \
		$(MAKEJVF) $$fnt rml ; \
	done ; \
	for fnt in jis-v jisn-v ; do \
		$(MAKEJVF) $$fnt rmlv ; \
	done ; \
	for fnt in jisg jisgn ; do \
		$(MAKEJVF) $$fnt gbm ; \
	done ; \
	for fnt in jisg-v jisgn-v ; do \
		$(MAKEJVF) $$fnt gbmv ; \
	done ; \

move:
	mkdir -pv ../tfm ../vf
	mv *.tfm ../tfm
	mv *.vf ../vf
