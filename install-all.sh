#!/usr/bin/env sh

sudo true

if test -f ${HOME}/update-all.sh; then
  cd ${HOME}
else
  echo -n "==== Resetting gizmos ... "
  cd ${HOME} && rm -rf ${HOME}/.git*
  git init --quiet && git branch -m main
  echo "OK"
  echo -n "==== Adding origin to the world ... "
  git remote add origin https://github.com/kwyxz/steamdeck.git
  echo "OK"
  echo -n "==== Pulling things out and throwing them together ... "
  git fetch --all --quiet 1>/dev/null
  echo -n "beep ... "
  git reset --hard origin/main --quiet
  echo -n "boop ... "
  git branch --set-upstream-to=origin/main --quiet
  echo "OK"
  echo -n "==== Confirming we did not break anything yet ... "
  git ls-files -z --deleted | xargs -0 git checkout -- 1>/dev/null
  echo "phew that was close"
  echo -n "==== Reinitializing booster rockets (please wait) ... "
  git submodule update --quiet --no-fetch --init --recursive 2>/dev/null
  echo "OK"
  echo -n "==== Jettisoning Elon Musk into the Sun ... "
  cd ${HOME}/.config/retroarch/shaders/shaders_slang/ && git reset --hard origin/master --quiet
  cd ${HOME} && git add .config/retroarch/shaders/shaders_slang/
  echo "OK"
  git commit -m "Confirming changes to slang repo" 1>/dev/null 2>/dev/null
  echo -n "==== Recombobulating bozos ... "
  cd ${HOME}/.config/retroarch/shaders/Mega_Bezel_Community/Duimon-Mega-Bezel && git reset --hard origin/main --quiet
  cd ${HOME} && git add .config/retroarch/shaders/Mega_Bezel_Community/Duimon-Mega-Bezel
  echo "OK"
  git commit -m "Confirming changes to Duimon mega bezels" 1>/dev/null 2>/dev/null
  echo -n "==== One last thing and we're good to go ... "
  git submodule update --init --recursive
  echo "OK"
  cd ${HOME}
  echo "==== Now installing emulators"
fi

sh ./update-all.sh
