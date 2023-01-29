#!/usr/bin/env sh

EMUPATH="/home/deck/pcsx2"
REPO="https://github.com/PCSX2/pcsx2"
LATEST=$(git -c 'versionsort.suffix=-' ls-remote --exit-code --refs --sort='version:refname' --tags ${REPO}.git '*.*.*' | tail -n1 | cut -d '/' -f3 | tr -d 'v')

echo -n "Downloading PCSX2 AppImage v${LATEST} ... " && wget ${REPO}/releases/download/v${LATEST}/pcsx2-v${LATEST}-linux-AppImage-64bit-Qt.AppImage -O ${EMUPATH}/pcsx2-x64.AppImage 2>/dev/null && chmod 755 ${EMUPATH}/pcsx2-x64.AppImage && echo "OK" || echo "ERROR"
