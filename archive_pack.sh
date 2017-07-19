#!/usr/bin/env bash

set -ex

TMP_DIR=$(mktemp -d)

tar -zcvf ${TMP_DIR}/archive.tar.gz -C $(dirname $1) $(basename $1)
gpg2 --cipher-algo AES256 -c ${TMP_DIR}/archive.tar.gz

read -r -p "Update Dropbox? [Y/n]" response
if [[ $response =~ ^(yes|y| ) ]] | [ -z $response ]; then
    cp -f ${TMP_DIR}/archive.tar.gz.gpg ${HOME}/Dropbox
fi

read -r -p "Update S3? [Y/n]" response
if [[ $response =~ ^(yes|y| ) ]] | [ -z $response ]; then
    echo "Fix me!"
fi

read -r -p "Clean up? [Y/n]" response
if [[ $response =~ ^(yes|y| ) ]] | [ -z $response ]; then
    rm -rf ${TMP_DIR}
fi
