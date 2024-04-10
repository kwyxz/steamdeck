#/usr/bin/env sh

git checkout main
/home/deck/Applications/duckstation/install-duckstation.sh
/home/deck/Applications/pcsx2/install-pcsx2.sh
/home/deck/Applications/cemu/install-cemu.sh
/home/deck/Applications/citra/install-citra.sh
/home/deck/Applications/redream/install-redream.sh
/home/deck/Applications/ryujinx/install-ryujinx.sh
/home/deck/Applications/suyu/install-suyu.sh
/home/deck/Applications/xemu/install-xemu.sh
/home/deck/Applications/xenia/install-xenia.sh
git pull && git submodule update --recursive --remote
sudo flatpak update -y
flatpak update -y
