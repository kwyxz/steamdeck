#/usr/bin/env sh

git checkout main
/home/deck/Applications/duckstation/install-duckstation.sh
/home/deck/Applications/pcsx2/install-pcsx2.sh
/home/deck/Applications/cemu/install-cemu.sh
/home/deck/Applications/citra/install-citra.sh
/home/deck/Applications/redream/install-redream.sh
/home/deck/Applications/ryujinx/install-ryujinx.sh
#/home/deck/Applications/suyu/install-suyu.sh
/home/deck/Applications/xemu/install-xemu.sh
/home/deck/Applications/xenia/install-xenia.sh
git pull && git submodule update --recursive --remote
if flatpak --system list | grep -q MAME; then
  sudo flatpak -y remove org.mamedev.MAME && flatpak -y --user install org.mamedev.MAME
fi
if flatpak --system list | grep -q Ryujinx; then
  sudo flatpak -y remove org.ryujinx.Ryujinx && flatpak -y --user install org.ryujinx.Ryujinx
fi
if flatpak --system list | grep -q Lime3DS; then
  sudo flatpak -y remove io.github.lime3ds.Lime3DS && flatpak -y --user install io.github.lime3ds.Lime3DS
fi
flatpak update -y --user
