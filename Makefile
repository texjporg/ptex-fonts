TEXMF = $(shell kpsewhich -var-value=TEXMFHOME)
PWDF = $(shell pwd)

.PHONY: default install clean
default:
	cd $(PWDF)/source ; make ; make move
install:
	mkdir -p ${TEXMF}/doc/fonts/ptex-fonts
	cp ./LICENSE ${TEXMF}/doc/fonts/ptex-fonts/
	cp ./README.md ${TEXMF}/doc/fonts/ptex-fonts/
	cp ./Changes_makejvf ${TEXMF}/doc/fonts/ptex-fonts/
	cp ./README_makejvf ${TEXMF}/doc/fonts/ptex-fonts/
	mkdir -p ${TEXMF}/fonts/source/ptex-fonts/jis
	cp ./source/jis* ${TEXMF}/fonts/source/ptex-fonts/jis/
	mkdir -p ${TEXMF}/fonts/source/ptex-fonts/nmin-ngoth
	cp ./source/n* ${TEXMF}/fonts/source/ptex-fonts/nmin-ngoth/
	mkdir -p ${TEXMF}/fonts/source/ptex-fonts/standard
	cp ./source/min* ${TEXMF}/fonts/source/ptex-fonts/standard/
	cp ./source/goth* ${TEXMF}/fonts/source/ptex-fonts/standard/
	cp ./source/t* ${TEXMF}/fonts/source/ptex-fonts/standard/
	mkdir -p ${TEXMF}/fonts/tfm/ptex-fonts/dvips
	cp ./tfm/futo* ${TEXMF}/fonts/tfm/ptex-fonts/dvips/
	cp ./tfm/gbm* ${TEXMF}/fonts/tfm/ptex-fonts/dvips/
	cp ./tfm/gtb* ${TEXMF}/fonts/tfm/ptex-fonts/dvips/
	cp ./tfm/jun* ${TEXMF}/fonts/tfm/ptex-fonts/dvips/
	cp ./tfm/rml* ${TEXMF}/fonts/tfm/ptex-fonts/dvips/
	cp ./tfm/ryumin* ${TEXMF}/fonts/tfm/ptex-fonts/dvips/
	mkdir -p ${TEXMF}/fonts/tfm/ptex-fonts/jis
	cp ./tfm/jis* ${TEXMF}/fonts/tfm/ptex-fonts/jis/
	mkdir -p ${TEXMF}/fonts/tfm/ptex-fonts/morisawa
	cp ./tfm/Futo* ${TEXMF}/fonts/tfm/ptex-fonts/morisawa/
	cp ./tfm/Gothic* ${TEXMF}/fonts/tfm/ptex-fonts/morisawa/
	cp ./tfm/Jun* ${TEXMF}/fonts/tfm/ptex-fonts/morisawa/
	cp ./tfm/Ryumin* ${TEXMF}/fonts/tfm/ptex-fonts/morisawa/
	mkdir -p ${TEXMF}/fonts/tfm/ptex-fonts/nmin-ngoth
	cp ./tfm/n* ${TEXMF}/fonts/tfm/ptex-fonts/nmin-ngoth/
	mkdir -p ${TEXMF}/fonts/tfm/ptex-fonts/standard
	cp ./tfm/min* ${TEXMF}/fonts/tfm/ptex-fonts/standard/
	cp ./tfm/goth* ${TEXMF}/fonts/tfm/ptex-fonts/standard/
	cp ./tfm/t* ${TEXMF}/fonts/tfm/ptex-fonts/standard/
	mkdir -p ${TEXMF}/fonts/vf/ptex-fonts/jis
	cp ./vf/jis* ${TEXMF}/fonts/vf/ptex-fonts/jis/
	mkdir -p ${TEXMF}/fonts/vf/ptex-fonts/morisawa
	cp ./vf/Futo* ${TEXMF}/fonts/vf/ptex-fonts/morisawa/
	cp ./vf/Gothic* ${TEXMF}/fonts/vf/ptex-fonts/morisawa/
	cp ./vf/Jun* ${TEXMF}/fonts/vf/ptex-fonts/morisawa/
	cp ./vf/Ryumin* ${TEXMF}/fonts/vf/ptex-fonts/morisawa/
	mkdir -p ${TEXMF}/fonts/vf/ptex-fonts/nmin-ngoth
	cp ./vf/n* ${TEXMF}/fonts/vf/ptex-fonts/nmin-ngoth/
	mkdir -p ${TEXMF}/fonts/vf/ptex-fonts/standard
	cp ./vf/min* ${TEXMF}/fonts/vf/ptex-fonts/standard/
	cp ./vf/goth* ${TEXMF}/fonts/vf/ptex-fonts/standard/
	cp ./vf/t* ${TEXMF}/fonts/vf/ptex-fonts/standard/

clean:
	rm -rf tfm vf
