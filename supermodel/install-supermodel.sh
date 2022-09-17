#!/usr/bin/env sh

printf "%s\n" "Setting RootFS read-write"
sudo steamos-readonly disable
printf "%s\n" "Downloading latest supermodel revision"
rm -rf /tmp/Supermodel
git clone https://github.com/trzy/Supermodel.git /tmp/Supermodel
cd /tmp/Supermodel
printf "%s\n" "Downloading libraries"
sudo pacman-key --init
sudo pacman-key --populate archlinux
sudo pacman -S --needed --noconfirm sdl2 sdl2_gfx sdl2_image sdl2_mixer sdl2_net sdl2_ttf mesa glu mesa-utils zlib libglvnd libxcb libx11 libxau libxdmcp
printf "%s\n" "Setting RootFS read-only"
sudo steamos-readonly enable
printf "%s\n" "Building Supermodel, please wait 30 seconds"
make -f Makefiles/Makefile.UNIX -j4 >/dev/null 1>/dev/null 2>/dev/null && install -m 0755 bin/supermodel /home/deck/supermodel/supermodel && printf "%s\n" "All done" || printf "%s\n" "Error: could not build/install Supermodel"
