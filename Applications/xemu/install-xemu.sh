#!/usr/bin/env sh

EMUPATH="/home/deck/Applications/xemu"
REPO="https://github.com/xemu-project/xemu"
LATEST=$(git -c 'versionsort.suffix=-' ls-remote --exit-code --refs --sort='version:refname' --tags ${REPO}.git '*.*.*' | tail -n1 | cut -d '/' -f3 | tr -d 'v')

echo -n "Downloading Xemu AppImage v${LATEST} ... " && wget ${REPO}/releases/download/v${LATEST}/xemu-v${LATEST}-x86_64.AppImage -O ${EMUPATH}/xemu-x64.AppImage 2>/dev/null && chmod 755 ${EMUPATH}/xemu-x64.AppImage && echo "OK" || echo "ERROR"
