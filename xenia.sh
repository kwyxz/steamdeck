#!/usr/bin/env sh
# xenia.sh

# Proton Launcher Script
PROTONLAUNCH="/home/deck/Emulation/tools/proton-launch.sh"

# Cemu.exe location
XENIA="/home/deck/Emulation/roms/xbox360/xenia.exe"

# Call the Proton launcher script and give the arguments
"${PROTONLAUNCH}" -p '7.0' -- "${XENIA}" "${@}"
