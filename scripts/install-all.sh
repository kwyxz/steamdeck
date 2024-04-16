#!/usr/bin/env sh

sudo true

if test -f ${HOME}/scripts/update-all.sh; then
  cd ${HOME}
else
  echo -n "==== Clean up existing git files ... "
  cd ${HOME} && rm -rf ${HOME}/.git*
  git init --quiet && git branch -m main
  echo "OK"
  echo -n "==== Adding repository origin ... "
  git remote add origin https://github.com/kwyxz/steamdeck.git
  echo "OK"
  echo -n "==== Fetching repo contents ... "
  git fetch --all --quiet 1>/dev/null
  echo -n "beep ... "
  git reset --hard origin/main --quiet
  echo -n "boop ... "
  git branch --set-upstream-to=origin/main --quiet
  echo "OK"
  echo -n "==== Confirming we did not break anything yet ... "
  git ls-files -z --deleted | xargs -0 git checkout -- 1>/dev/null
  echo "OK"
  echo -n "==== Initializing submodules ... "
  git submodule update --quiet --no-fetch --init --recursive 2>/dev/null
  echo "OK"
  echo -n "==== Reset shaders_slang repo ... "
  cd ${HOME}/.config/retroarch/shaders/shaders_slang/ && git reset --hard origin/master --quiet
  cd ${HOME} && git add .config/retroarch/shaders/shaders_slang/
  echo "OK"
  git commit -m "Confirming changes to slang repo" 1>/dev/null 2>/dev/null
  echo -n "==== Reset Mega-Bezel repo ... "
  cd ${HOME}/.config/retroarch/shaders/Mega_Bezel_Community/Duimon-Mega-Bezel && git reset --hard origin/main --quiet
  cd ${HOME} && git add .config/retroarch/shaders/Mega_Bezel_Community/Duimon-Mega-Bezel
  echo "OK"
  git commit -m "Confirming changes to Duimon mega bezels" 1>/dev/null 2>/dev/null
  echo -n "==== One last thing and we're good to go ... "
  git submodule update --init --recursive
  echo "OK"
  cd ${HOME}
  echo "==== Now installing emulators"
  flatpak install org.mamedev.MAME -y --user
  flatpak install org.ryujinx.Ryujinx -y --user
  flatpak install io.github.lime3ds.Lime3DS -y --user
fi

sh $HOME/scripts/update-all.sh
