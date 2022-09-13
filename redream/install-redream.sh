#!/usr/bin/env sh

REDREAM_URL="https://redream.io/download"
REDREAM_TMP="/tmp/redream.tar.gz"
REDREAMPATH="/home/deck/redream"

printf "%s\n" " * downloading Redream"
rm -f ${REDREAM_TMP}
REDREAM_DEV="$(curl -s ${REDREAM_URL} | grep x86_64-linux | grep -- "v.\..\..-.*-.*\.tar\.gz" | head -1 | cut -d '"' -f2 | cut -d '/' -f3)"
curl -s ${REDREAM_URL}/${REDREAM_DEV} -o ${REDREAM_TMP}
printf "%s\n" "* installing Redream"
tar zxf ${REDREAM_TMP} -C ${REDREAMPATH}/
