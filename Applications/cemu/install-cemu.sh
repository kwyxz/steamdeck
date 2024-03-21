#!/usr/bin/env sh

EMUPATH="/home/deck/Applications/cemu"
REPO="https://github.com/cemu-project/Cemu"
LATEST=$(git -c 'versionsort.suffix=-' ls-remote --exit-code --refs --sort='version:refname' --tags ${REPO}.git '*.*-*' | tail -n1 | cut -d '/' -f3 | tr -d 'v')

echo -n "Downloading Cemu AppImage v${LATEST} ... " && wget ${REPO}/releases/download/v${LATEST}/Cemu-${LATEST}-x86_64.AppImage -O ${EMUPATH}/cemu-x64.AppImage 2>/dev/null && chmod 755 ${EMUPATH}/cemu-x64.AppImage && echo "OK" || echo "ERROR"
