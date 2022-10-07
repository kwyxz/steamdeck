#!/usr/bin/env sh

SUPERMODEL_PATH="/home/deck/supermodel"
SOURCE_PATH="/tmp/Supermodel"

printf "%s\n" "Setting RootFS read-write"
sudo steamos-readonly disable
printf "%s\n" "Downloading latest supermodel revision"
rm -rf "${SOURCE_PATH}"
git clone https://github.com/trzy/Supermodel.git "${SOURCE_PATH}"
cd "${SOURCE_PATH}"
printf "%s\n" "Downloading libraries"
sudo pacman-key --init
sudo pacman-key --populate archlinux
if test -f /usr/include/errno.h; then
  PACMAN_OPTS="--needed"
else
  PACMAN_OPTS=""
fi
sudo pacman -S --noconfirm $PACMAN_OPTS gcc glibc sdl2 sdl2_gfx sdl2_image sdl2_mixer sdl2_net sdl2_ttf mesa glu mesa-utils zlib libglvnd libxcb libx11 libxau libxdmcp linux-headers linux-api-headers xorgproto
printf "%s\n" "Setting RootFS read-only"
sudo steamos-readonly enable
printf "%s\n" "Building Supermodel, please wait 30 seconds"
make -f Makefiles/Makefile.UNIX -j4 >/dev/null 1>/dev/null 2>/dev/null && install -m 0755 "${SOURCE_PATH}/bin/supermodel" "${SUPERMODEL_PATH}/supermodel" && printf "%s\n" "All done" || printf "%s\n" "Error: could not build/install Supermodel"
