#/usr/bin/env sh

/home/deck/Applications/duckstation/install-duckstation.sh
/home/deck/Applications/pcsx2/install-pcsx2.sh
/home/deck/Applications/cemu/install-cemu.sh
/home/deck/Applications/citra/install-citra.sh
/home/deck/Applications/redream/install-redream.sh
/home/deck/Applications/xenia/install-xenia.sh
/home/deck/Applications/yuzu/install-yuzu.sh
git pull && git submodule update --recursive --remote
sudo flatpak update -y
flatpak update -y
