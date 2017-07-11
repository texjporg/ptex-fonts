MAKEJVF  = makejvf
PLTOTF   = ppltotf -kanji=jis

all: tfm vf

tfm:
	for fnt in min goth nmin ngoth tmin tgoth ; do \
		for size in 10 9 8 7 6 5 ; do \
			$(PLTOTF) $$fnt$$size.pl $$fnt$$size.tfm ; \
		done ; \
	done
	for fnt in jis jisn jis-v jisn-v ; do \
		$(PLTOTF) $$fnt.pl $$fnt.tfm ; \
	done
	cp jis.tfm jisg.tfm
	cp jisn.tfm jisgn.tfm
	cp jis-v.tfm jisg-v.tfm
	cp jisn-v.tfm jisgn-v.tfm
	for fnt in Ryumin-Light FutoMinA101-Bold ; do \
		cp min10.tfm $$fnt-H.tfm ; \
		cp tmin10.tfm $$fnt-V.tfm ; \
		cp jis.tfm $$fnt-J.tfm ; \
	done
	for fnt in GothicBBB-Medium FutoGoB101-Bold Jun101-Light ; do \
		cp goth10.tfm $$fnt-H.tfm ; \
		cp tgoth10.tfm $$fnt-V.tfm ; \
		cp jisg.tfm $$fnt-J.tfm ; \
	done

vf:
	for fnt in min nmin ; do \
		for size in 10 9 8 7 6 5 ; do \
			$(MAKEJVF) $$fnt$$size rml ; \
		done ; \
	done
	for fnt in tmin ; do \
		for size in 10 9 8 7 6 5 ; do \
			$(MAKEJVF) -m $$fnt$$size rmlv ; \
		done ; \
	done
	for fnt in goth ngoth ; do \
		for size in 10 9 8 7 6 5 ; do \
			$(MAKEJVF) $$fnt$$size gbm ; \
		done ; \
	done
	for fnt in tgoth ; do \
		for size in 10 9 8 7 6 5 ; do \
			$(MAKEJVF) -m $$fnt$$size gbmv ; \
		done ; \
	done
	for fnt in jis jisn ; do \
		$(MAKEJVF) $$fnt rml ; \
	done
	for fnt in jis-v jisn-v ; do \
		$(MAKEJVF) $$fnt rmlv ; \
	done
	for fnt in jisg jisgn ; do \
		$(MAKEJVF) $$fnt gbm ; \
	done
	for fnt in jisg-v jisgn-v ; do \
		$(MAKEJVF) $$fnt gbmv ; \
	done
	for VAR in J H ; do \
		$(MAKEJVF) Ryumin-Light-$$VAR ryumin-l ; \
		$(MAKEJVF) FutoMinA101-Bold-$$VAR futomin-b ; \
		$(MAKEJVF) GothicBBB-Medium-$$VAR gtbbb-m ; \
		$(MAKEJVF) FutoGoB101-Bold-$$VAR futogo-b ; \
		$(MAKEJVF) Jun101-Light-$$VAR jun101-l ; \
	done
	for VAR in V ; do \
		$(MAKEJVF) Ryumin-Light-$$VAR ryumin-l-v ; \
		$(MAKEJVF) FutoMinA101-Bold-$$VAR futomin-b-v ; \
		$(MAKEJVF) GothicBBB-Medium-$$VAR gtbbb-m-v ; \
		$(MAKEJVF) FutoGoB101-Bold-$$VAR futogo-b-v ; \
		$(MAKEJVF) Jun101-Light-$$VAR jun101-l-v ; \
	done

move:
	mkdir -pv ../tfm ../vf
	mv *.tfm ../tfm
	mv *.vf ../vf
