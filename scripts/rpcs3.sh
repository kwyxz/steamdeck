#!/usr/bin/env sh

RPCS3DIR="/home/deck/Applications"

if test -f ${RPCS3DIR}/rpcs3.AppImage; then
  ${RPCS3DIR}/rpcs3.AppImage --no-gui "${1}"
else
  /var/lib/flatpak/exports/bin/net.rpcs3.RPCS3 --no-gui "${1}"
fi
