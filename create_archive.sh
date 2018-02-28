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
rm -rf $TMP/$PROJECT/man
perl -pi.bak -e "s/\\\$RELEASEDATE/$RELEASEDATE/g" $TMP/$PROJECT/README.md
rm -f $TMP/$PROJECT/README.md.bak

mkdir -p $TMP/$PROJECT/doc/fonts/$PROJECT
mv $TMP/$PROJECT/LICENSE $TMP/$PROJECT/doc/fonts/$PROJECT/
mv $TMP/$PROJECT/README.md $TMP/$PROJECT/doc/fonts/$PROJECT/
mv $TMP/$PROJECT/Changes_makejvf $TMP/$PROJECT/doc/fonts/$PROJECT/
mv $TMP/$PROJECT/README_makejvf $TMP/$PROJECT/doc/fonts/$PROJECT/

mkdir -p $TMP/$PROJECT/fonts/source/$PROJECT/jis
mv $TMP/$PROJECT/source/jis* $TMP/$PROJECT/fonts/source/$PROJECT/jis/

mkdir -p $TMP/$PROJECT/fonts/source/$PROJECT/nmin-ngoth
mv $TMP/$PROJECT/source/n* $TMP/$PROJECT/fonts/source/$PROJECT/nmin-ngoth/

mkdir -p $TMP/$PROJECT/fonts/source/$PROJECT/standard
mv $TMP/$PROJECT/source/min* $TMP/$PROJECT/fonts/source/$PROJECT/standard/
mv $TMP/$PROJECT/source/goth* $TMP/$PROJECT/fonts/source/$PROJECT/standard/
mv $TMP/$PROJECT/source/t* $TMP/$PROJECT/fonts/source/$PROJECT/standard/

mkdir -p $TMP/$PROJECT/fonts/tfm/$PROJECT/dvips
mv $TMP/$PROJECT/tfm/gbm* $TMP/$PROJECT/fonts/tfm/$PROJECT/dvips/
mv $TMP/$PROJECT/tfm/rml* $TMP/$PROJECT/fonts/tfm/$PROJECT/dvips/

mkdir -p $TMP/$PROJECT/fonts/tfm/$PROJECT/jis
mv $TMP/$PROJECT/tfm/jis* $TMP/$PROJECT/fonts/tfm/$PROJECT/jis/

mkdir -p $TMP/$PROJECT/fonts/tfm/$PROJECT/nmin-ngoth
mv $TMP/$PROJECT/tfm/n* $TMP/$PROJECT/fonts/tfm/$PROJECT/nmin-ngoth/

mkdir -p $TMP/$PROJECT/fonts/tfm/$PROJECT/standard
mv $TMP/$PROJECT/tfm/min* $TMP/$PROJECT/fonts/tfm/$PROJECT/standard/
mv $TMP/$PROJECT/tfm/goth* $TMP/$PROJECT/fonts/tfm/$PROJECT/standard/
mv $TMP/$PROJECT/tfm/t* $TMP/$PROJECT/fonts/tfm/$PROJECT/standard/

mkdir -p $TMP/$PROJECT/fonts/vf/$PROJECT/jis
mv $TMP/$PROJECT/vf/jis* $TMP/$PROJECT/fonts/vf/$PROJECT/jis/

mkdir -p $TMP/$PROJECT/fonts/vf/$PROJECT/nmin-ngoth
mv $TMP/$PROJECT/vf/n* $TMP/$PROJECT/fonts/vf/$PROJECT/nmin-ngoth/

mkdir -p $TMP/$PROJECT/fonts/vf/$PROJECT/standard
mv $TMP/$PROJECT/vf/min* $TMP/$PROJECT/fonts/vf/$PROJECT/standard/
mv $TMP/$PROJECT/vf/goth* $TMP/$PROJECT/fonts/vf/$PROJECT/standard/
mv $TMP/$PROJECT/vf/t* $TMP/$PROJECT/fonts/vf/$PROJECT/standard/

rm $TMP/$PROJECT/Makefile $TMP/$PROJECT/source/Makefile
rmdir $TMP/$PROJECT/{source,tfm,vf}

cd $TMP/$PROJECT && zip -r $TMP/$PROJECT.tds.zip *
cd $PWDF
rm -rf $TMP/$PROJECT

echo
echo " * Create $PROJECT.zip ($RELEASEDATE)"
git archive --format=tar --prefix=$PROJECT/ HEAD | (cd $TMP && tar xf -)
rm $TMP/$PROJECT/create_archive.sh
rm $TMP/$PROJECT/Makefile $TMP/$PROJECT/source/Makefile
rm -rf $TMP/$PROJECT/man
perl -pi.bak -e "s/\\\$RELEASEDATE/$RELEASEDATE/g" $TMP/$PROJECT/README.md
rm -f $TMP/$PROJECT/README.md.bak

cd $TMP && zip -r $PWDF/$PROJECT.zip $PROJECT $PROJECT.tds.zip
rm -rf $TMP/$PROJECT $TMP/$PROJECT.tds.zip
echo
echo " * Done: $PROJECT.zip ($RELEASEDATE)"
