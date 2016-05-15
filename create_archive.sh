#!/bin/sh

PROJECT=ptex-fonts
TMP=/tmp
PWDF=`pwd`
LATESTRELEASEDATE=`git tag | sort -r | head -n 1`
RELEASEDATE=`git tag --points-at HEAD | sort -r | head -n 1`

if [ -z "$RELEASEDATE" ]; then
    RELEASEDATE="**not tagged**; later than $LATESTRELEASEDATE?"
fi

echo " * Create $PROJECT.tds.zip"
git archive --format=tar --prefix=$PROJECT/ HEAD | (cd $TMP && tar xf -)
rm $TMP/$PROJECT/create_archive.sh
perl -pi.bak -e "s/\\\$RELEASEDATE/$RELEASEDATE/g" $TMP/$PROJECT/README.md
rm -f $TMP/$PROJECT/README.md.bak

mkdir -p $TMP/$PROJECT/doc/fonts/$PROJECT
mv $TMP/$PROJECT/LICENSE $TMP/$PROJECT/doc/fonts/$PROJECT/
mv $TMP/$PROJECT/README.md $TMP/$PROJECT/doc/fonts/$PROJECT/
mv $TMP/$PROJECT/Changes_makejvf $TMP/$PROJECT/doc/fonts/$PROJECT/
mv $TMP/$PROJECT/README_makejvf $TMP/$PROJECT/doc/fonts/$PROJECT/

mkdir -p $TMP/$PROJECT/fonts/source/$PROJECT/ascgrp
mv $TMP/$PROJECT/source/asc* $TMP/$PROJECT/fonts/source/$PROJECT/ascgrp/

mkdir -p $TMP/$PROJECT/fonts/source/$PROJECT/jis
mv $TMP/$PROJECT/source/jis* $TMP/$PROJECT/fonts/source/$PROJECT/jis/

mkdir -p $TMP/$PROJECT/fonts/source/$PROJECT/nmin-ngoth
mv $TMP/$PROJECT/source/n* $TMP/$PROJECT/fonts/source/$PROJECT/nmin-ngoth/

mkdir -p $TMP/$PROJECT/fonts/source/$PROJECT/standard
mv $TMP/$PROJECT/source/* $TMP/$PROJECT/fonts/source/$PROJECT/standard/

mkdir -p $TMP/$PROJECT/fonts/tfm/$PROJECT/ascgrp
mv $TMP/$PROJECT/tfm/asc* $TMP/$PROJECT/fonts/tfm/$PROJECT/ascgrp/

mkdir -p $TMP/$PROJECT/fonts/tfm/$PROJECT/dvips
mv $TMP/$PROJECT/tfm/futo* $TMP/$PROJECT/fonts/tfm/$PROJECT/dvips/
mv $TMP/$PROJECT/tfm/gbm* $TMP/$PROJECT/fonts/tfm/$PROJECT/dvips/
mv $TMP/$PROJECT/tfm/gtb* $TMP/$PROJECT/fonts/tfm/$PROJECT/dvips/
mv $TMP/$PROJECT/tfm/jun* $TMP/$PROJECT/fonts/tfm/$PROJECT/dvips/
mv $TMP/$PROJECT/tfm/rml* $TMP/$PROJECT/fonts/tfm/$PROJECT/dvips/
mv $TMP/$PROJECT/tfm/ryumin* $TMP/$PROJECT/fonts/tfm/$PROJECT/dvips/

mkdir -p $TMP/$PROJECT/fonts/tfm/$PROJECT/jis
mv $TMP/$PROJECT/tfm/jis* $TMP/$PROJECT/fonts/tfm/$PROJECT/jis/

mkdir -p $TMP/$PROJECT/fonts/tfm/$PROJECT/morisawa
mv $TMP/$PROJECT/tfm/Futo* $TMP/$PROJECT/fonts/tfm/$PROJECT/morisawa/
mv $TMP/$PROJECT/tfm/Gothic* $TMP/$PROJECT/fonts/tfm/$PROJECT/morisawa/
mv $TMP/$PROJECT/tfm/Jun* $TMP/$PROJECT/fonts/tfm/$PROJECT/morisawa/
mv $TMP/$PROJECT/tfm/Ryumin* $TMP/$PROJECT/fonts/tfm/$PROJECT/morisawa/

mkdir -p $TMP/$PROJECT/fonts/tfm/$PROJECT/nmin-ngoth
mv $TMP/$PROJECT/tfm/n* $TMP/$PROJECT/fonts/tfm/$PROJECT/nmin-ngoth/

mkdir -p $TMP/$PROJECT/fonts/tfm/$PROJECT/standard
mv $TMP/$PROJECT/tfm/* $TMP/$PROJECT/fonts/tfm/$PROJECT/standard/

mkdir -p $TMP/$PROJECT/fonts/type1/$PROJECT/ascgrp
mv $TMP/$PROJECT/type1/* $TMP/$PROJECT/fonts/type1/$PROJECT/ascgrp/

mkdir -p $TMP/$PROJECT/fonts/vf/$PROJECT/jis
mv $TMP/$PROJECT/vf/jis* $TMP/$PROJECT/fonts/vf/$PROJECT/jis/

mkdir -p $TMP/$PROJECT/fonts/vf/$PROJECT/morisawa
mv $TMP/$PROJECT/vf/Futo* $TMP/$PROJECT/fonts/vf/$PROJECT/morisawa/
mv $TMP/$PROJECT/vf/Gothic* $TMP/$PROJECT/fonts/vf/$PROJECT/morisawa/
mv $TMP/$PROJECT/vf/Jun* $TMP/$PROJECT/fonts/vf/$PROJECT/morisawa/
mv $TMP/$PROJECT/vf/Ryumin* $TMP/$PROJECT/fonts/vf/$PROJECT/morisawa/

mkdir -p $TMP/$PROJECT/fonts/vf/$PROJECT/nmin-ngoth
mv $TMP/$PROJECT/vf/n* $TMP/$PROJECT/fonts/vf/$PROJECT/nmin-ngoth/

mkdir -p $TMP/$PROJECT/fonts/vf/$PROJECT/standard
mv $TMP/$PROJECT/vf/* $TMP/$PROJECT/fonts/vf/$PROJECT/standard/

rmdir $TMP/$PROJECT/{source,tfm,type1,vf}

cd $TMP/$PROJECT && zip -r $TMP/$PROJECT.tds.zip *
cd $PWDF
rm -rf $TMP/$PROJECT

echo
echo " * Create $PROJECT.zip ($RELEASEDATE)"
git archive --format=tar --prefix=$PROJECT/ HEAD | (cd $TMP && tar xf -)
rm $TMP/$PROJECT/create_archive.sh
perl -pi.bak -e "s/\\\$RELEASEDATE/$RELEASEDATE/g" $TMP/$PROJECT/README.md
rm -f $TMP/$PROJECT/README.md.bak

cd $TMP && zip -r $PWDF/$PROJECT.zip $PROJECT $PROJECT.tds.zip
rm -rf $TMP/$PROJECT $TMP/$PROJECT.tds.zip
echo
echo " * Done: $PROJECT.zip ($RELEASEDATE)"
