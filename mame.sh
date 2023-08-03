#!/usr/bin/bash
# mame.sh

# MAME launcher
FLATPAK="/usr/bin/flatpak"

# MAME location
MAME="org.mamedev.MAME"

# Call the Flatpak launcher and give the arguments
"${FLATPAK}" run "${MAME}" -verbose -rompath /home/deck/Emulation/roms/arcade/;/home/deck/Emulation/roms/model1/;/home/deck/Emulation/roms/model2/ -inipath /home/deck/.mame/ -video bgfx -bgfx_path /home/deck/.mame/bgfx -bgfx_backend vulkan -bgfx_screen_chains crt-geom-deluxe "${@}"
