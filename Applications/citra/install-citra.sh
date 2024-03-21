#!/usr/bin/env sh

EMUPATH="/home/deck/Applications/citra"
TARGZ="citra-linux-appimage-20240303-0ff3440.tar.gz"
URL="https://archive.org/download/citra-nightly-2104"

if ! test -f "${EMUPATH}/${TARGZ}"; then
  echo -n "Downloading ${TARGZ} ... " && wget -q "${URL}/${TARGZ}" -O "${EMUPATH}/${TARGZ}" && tar zxf "${EMUPATH}/${TARGZ}" -C "${EMUPATH}" --strip-components=1 >/dev/null && echo "OK" || echo "ERROR"
else
  echo "Nothing to do : citra.AppImage already present"
fi
