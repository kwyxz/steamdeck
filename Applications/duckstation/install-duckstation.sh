#!/usr/bin/env sh

EMUPATH="/home/deck/Applications/duckstation"
REPO="https://github.com/stenzek/duckstation"
LATEST="preview"

echo -n "Downloading Duckstation AppImage ${LATEST} ... " && wget ${REPO}/releases/download/${LATEST}/DuckStation-x64.AppImage -O ${EMUPATH}/DuckStation-x64.AppImage 2>/dev/null && chmod 755 ${EMUPATH}/DuckStation-x64.AppImage && echo "OK" || echo "ERROR"
