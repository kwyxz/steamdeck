#!/usr/bin/env sh

BIGPEMU_URL='https://www.richwhitehouse.com/jaguar/index.php?content=download'
BIGPEMU_TMP="/tmp/bigpemu.tar.gz"
BIGPEMUPATH="/home/deck/Applications/"

rm -f ${BIGPEMU_TMP}
BIGPEMU_DEV="$(curl -s ${BIGPEMU_URL} | grep Linux64 | tr '>' '\n' | grep href | grep tar.gz | cut -d '"' -f2)"
printf "%s" "Downloading ${BIGPEMU_DEV} ... "
curl -s ${BIGPEMU_DEV} -o ${BIGPEMU_TMP} && tar zxf ${BIGPEMU_TMP} -C ${BIGPEMUPATH}/ && printf "%s\n%s" "OK" || printf "%s\n%s" "ERROR"
