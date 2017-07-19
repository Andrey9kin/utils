#!/usr/bin/env bash

set -ex

TMP_DIR=$(mktemp -d)
ARCHIVE=${1:-${HOME}/Dropbox/archive.tar.gz.gpg}

gpg2 -o ${TMP_DIR}/archive.tar.gz -d ${ARCHIVE}
tar xvf ${TMP_DIR}/archive.tar.gz -C ${TMP_DIR}

echo "Extracted to ${TMP_DIR}"
