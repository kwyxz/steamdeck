#!/usr/bin/env sh

REDREAM_URL="https://redream.io/download"
REDREAM_TMP="/tmp/redream.tar.gz"
REDREAMPATH="/home/deck/Applications/redream"

rm -f ${REDREAM_TMP}
REDREAM_DEV="$(curl -s ${REDREAM_URL} | grep x86_64-linux | grep -- "v.\..\..-.*-.*\.tar\.gz" | head -1 | cut -d '"' -f2 | cut -d '/' -f3)"
printf "%s" "Downloading ${REDREAM_DEV} ... "
curl -s ${REDREAM_URL}/${REDREAM_DEV} -o ${REDREAM_TMP} && tar zxf ${REDREAM_TMP} -C ${REDREAMPATH}/ && printf "%s\n%s" "OK" || printf "%s\n%s" "ERROR"
