#!/usr/bin/env sh

EMUPATH="/home/deck/Applications/ryujinx"
REPO="https://github.com/Ryujinx/release-channel-master"
LATEST=$(git -c 'versionsort.suffix=-' ls-remote --exit-code --refs --sort='version:refname' --tags ${REPO}.git '*.*.*' | tail -n1 | cut -d '/' -f3 | tr -d 'v')

echo -n "Downloading Ryujinx v${LATEST} ... " && wget ${REPO}/releases/download/${LATEST}/ryujinx-${LATEST}-linux_x64.tar.gz -O ${EMUPATH}/ryujinx-${LATEST}-linux_x64.tar.gz 2>/dev/null && tar zxf ${EMUPATH}/ryujinx-${LATEST}-linux_x64.tar.gz -C /home/deck/Applications/ && echo "OK" || echo "ERROR"
