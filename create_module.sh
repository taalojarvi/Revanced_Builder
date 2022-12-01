#!/bin/bash

git clone https://github.com/shimpact003/revanced-magisk-template -b main || exit 1

find . -type f -name "revanced-root.apk" -exec cp {} revanced-magisk-template/ \;
# cp build/revanced-root-signed.apk 
# cp com.google.android.youtube.apk revanced-magisk-template

cd revanced-magisk-template

zip -r ReVanced-root-MagiskModule.zip ./*

cd ..

cp revanced-magisk-template/ReVanced-root-MagiskModule.zip .

rm -rf revanced-magisk-template
