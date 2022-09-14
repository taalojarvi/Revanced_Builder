#!/bin/bash

git clone https://github.com/Lyceris-chan/revanced-magisk-template -b YouTube

cp build/revanced-root-signed.apk revanced-magisk-template
cp com.google.android.youtube.apk revanced-magisk-template

cd revanced-magisk-template

zip -r ReVanced-root-MagiskModule.zip ./*

cd ..

cp revanced-magisk-template/ReVanced-root-MagiskModule.zip .

rm -rf revanced-magisk-template
