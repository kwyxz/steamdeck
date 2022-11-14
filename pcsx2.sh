#!/usr/bin/env sh

#/usr/bin/flatpak run net.pcsx2.PCSX2 --fullscreen --nogui "${1}"
/home/deck/pcsx2/pcsx2-x64.AppImage -nogui -bigpicture -fullscreen -- "${1}"
