#!/bin/bash

if [[ $1 == "" ]]; then 
    echo "USAGE: deploy-example.sh build_dir"
    exit
fi
PWD=$(pwd)
CURR_DIR=$PWD/$1
if [[ ! -d $CURR_DIR ]]; then
    echo "Folder $CURR_DIR not exists."
    exit
fi

TMP_DIR=$CURR_DIR"/tmp/deploy/images/imx8mmea-ucom/"
UUU_DIR=$PWD"/uuu-deploy/"
UUU_FILES_DIR=$PWD"/uuu-deploy/files/"
if [[ ! -d $UUU_FILES_DIR ]]; then
    mkdir $UUU_FILES_DIR
fi

echo "Copying deploying files ..."

cp "$TMP_DIR"/imx-boot-imx8mmea-ucom-sd.bin-flash_evk "$UUU_FILES_DIR"/imx-boot-imx8mmea-ucom-sd.bin
cp "$TMP_DIR"/imx8mm-ea-ucom-kit_v2-1mw.dtb "$UUU_FILES_DIR"/


cp "$TMP_DIR."/ea-image-base-imx8mmea-ucom.sdimg "$UUU_FILES_DIR"/
cp "$TMP_DIR."/ea-image-base-imx8mmea-ucom.mender "$UUU_FILES_DIR"/

sudo "$UUU_DIR"/uuu "$UUU_DIR"deploy-image.uuu


