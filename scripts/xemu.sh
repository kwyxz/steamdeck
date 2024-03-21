#!/usr/bin/env sh
# xemu.sh

XEMUDIR="/home/deck/Applications/xemu"

if test -f ${XEMUDIR}/xemu.AppImage; then
#__GLX_VENDOR_LIBRARY_NAME=mesa MESA_LOADER_DRIVER_OVERRIDE=zink GALLIUM_DRIVER=zink /home/deck/xemu/xemu.AppImage -full-screen -dvd_path "${1}"
  ${XEMUDIR}/xemu.AppImage -full-screen -dvd_path "${1}"
else
#__GLX_VENDOR_LIBRARY_NAME=mesa MESA_LOADER_DRIVER_OVERRIDE=zink GALLIUM_DRIVER=zink /usr/bin/flatpak run app.xemu.xemu -full-screen -dvd_path "${1}"
  /usr/bin/flatpak run app.xemu.xemu -full-screen -dvd_path "${1}"
fi
