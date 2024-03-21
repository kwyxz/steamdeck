#!/usr/bin/env sh

REDREAM_URL="https://redream.io/download"
REDREAM_TMP="/tmp/redream.tar.gz"
REDREAMPATH="/home/deck/Applications/redream"

printf "%s" " * looking up Redream... "
rm -f ${REDREAM_TMP}
REDREAM_DEV="$(curl -s ${REDREAM_URL} | grep x86_64-linux | grep -- "v.\..\..-.*-.*\.tar\.gz" | head -1 | cut -d '"' -f2 | cut -d '/' -f3)"
printf "%s%s\n" "found version " "${REDREAM_DEV}"
printf "%s" " * downloading Redream... "
curl -s ${REDREAM_URL}/${REDREAM_DEV} -o ${REDREAM_TMP}
printf "%s\n%s" "done" " * installing Redream... "
tar zxf ${REDREAM_TMP} -C ${REDREAMPATH}/
printf "%s\n%s\n" "done" " * have fun!"
