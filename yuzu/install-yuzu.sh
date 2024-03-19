#!/usr/bin/env sh

EMUPATH="/home/deck/yuzu"
IMGEA="Yuzu-Linux-4176.AppImage"
IMGML="yuzu-mainline-20240304-537296095.AppImage"
URL="https://archive.org/download/yuzu-latest-builds-4th-march-2024"

for IMG in ${IMGEA} ${IMGML}; do
  if ! test -f ${IMG}; then
    echo -n "Downloading ${IMG} ... " && wget -q "${URL}/${IMG}" -O ${IMG} && chmod 755 ${IMG} && echo "OK" || echo "ERROR"
  else
    echo "Nothing to do : ${IMG} already present"
  fi
done
