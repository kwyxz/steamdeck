#!/usr/bin/env sh
# xenia_canary.sh

# Proton Launcher Script
PROTONLAUNCH="/home/deck/Emulation/tools/proton-launch.sh"

# xenia_canary.exe location
XENIA="/home/deck/Emulation/roms/xbox360/xenia_canary.exe"

# Call the Proton launcher script and give the arguments
"${PROTONLAUNCH}" -p 'GE-Proton7-55' -- "${XENIA}" "${@}"
