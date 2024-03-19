#!/usr/bin/env sh

if test -f Applications/rpcs3.AppImage; then
  /home/deck/Applications/rpcs3.AppImage --no-gui "${1}"
else
  /var/lib/flatpak/exports/bin/net.rpcs3.RPCS3 --no-gui "${1}"
fi
