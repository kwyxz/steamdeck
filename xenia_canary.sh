#!/usr/bin/env sh
# xenia.sh

# Proton Launcher Script
PROTONLAUNCH="/home/deck/Emulation/tools/proton-launch.sh"

# Cemu.exe location
XENIA="/home/deck/Emulation/roms/xbox360/xenia_canary.exe"

# Call the Proton launcher script and give the arguments
"${PROTONLAUNCH}" -p 'GE-Proton7-55' -- "${XENIA}" "${@}"
