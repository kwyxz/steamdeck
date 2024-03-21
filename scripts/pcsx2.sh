#!/usr/bin/env sh

PCSX2DIR="/home/deck/Applications/pcsx2"

${PCSX2DIR}/pcsx2-x64.AppImage -nogui -bigpicture -fullscreen -- "${1}"
