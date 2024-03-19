#!/usr/bin/env sh

if test -f /home/deck/Applications/xemu.AppImage; then
#__GLX_VENDOR_LIBRARY_NAME=mesa MESA_LOADER_DRIVER_OVERRIDE=zink GALLIUM_DRIVER=zink /home/deck/xemu/xemu.AppImage -full-screen -dvd_path "${1}"
  /home/deck/Applications/xemu.AppImage -full-screen -dvd_path "${1}"
else
#__GLX_VENDOR_LIBRARY_NAME=mesa MESA_LOADER_DRIVER_OVERRIDE=zink GALLIUM_DRIVER=zink /usr/bin/flatpak run app.xemu.xemu -full-screen -dvd_path "${1}"
  /usr/bin/flatpak run app.xemu.xemu -full-screen -dvd_path "${1}"
fi
