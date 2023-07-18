#!/usr/bin/env sh

EMUPATH="/home/deck/pcsx2"
REPO="https://github.com/PCSX2/pcsx2"
TAG=$(git -c 'versionsort.suffix=-' ls-remote --exit-code --refs --sort='version:refname' --tags ${REPO}.git '*.*.*' | tail -n1 | cut -d '/' -f3 | tr -d 'v')

echo -n "Downloading PCSX2 AppImage v${TAG} ... " && wget ${REPO}/releases/download/v${TAG}/pcsx2-v${TAG}-linux-appimage-x64-Qt.AppImage -O ${EMUPATH}/pcsx2-x64.AppImage 2>/dev/null && chmod 755 ${EMUPATH}/pcsx2-x64.AppImage && echo "OK" || echo "ERROR"
