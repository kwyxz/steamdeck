#/usr/bin/env sh

./duckstation/install-duckstation.sh
./pcsx2/install-pcsx2.sh
./cemu/install-cemu.sh
./supermodel/install-supermodel.sh
./redream/install-redream.sh
./xemu/install-xemu.sh
git pull && git submodule update --recursive --remote
sudo flatpak update -y
flatpak update -y
