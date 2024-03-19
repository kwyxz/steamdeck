#/usr/bin/env sh

./duckstation/install-duckstation.sh
./pcsx2/install-pcsx2.sh
./cemu/install-cemu.sh
./citra/install-citra.sh
./supermodel/install-supermodel.sh
./redream/install-redream.sh
./xemu/install-xemu.sh
./xenia/install-xenia.sh
./yuzu/install-yuzu.sh
git pull && git submodule update --recursive --remote
sudo flatpak update -y
flatpak update -y
