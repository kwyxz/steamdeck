#!/usr/bin/env sh

EMUPATH="/home/deck/Emulation/roms/xbox360/"
REPO="https://github.com/xenia-canary/xenia-canary"
LATEST="experimental"

echo -n "Downloading Xenia Canary ${LATEST} ... " && wget ${REPO}/releases/download/${LATEST}/xenia_canary.zip -O ${HOME}/xenia/xenia_canary.zip 2>/dev/null && unzip -o -j ${HOME}/xenia/xenia_canary.zip -d ${EMUPATH} >/dev/null 2>/dev/null && echo "OK" || echo "ERROR"
