#/usr/bin/env sh

# fix shaders and options for arcade games requiring vertical monitors
# a bit slow due to how many times we run MAME but most accurate and up to date

echo "this has been deprecated by Duimon bezels which are unfortunately buggy right now"
exit 0

for MACHINE in cps1 cps2 naomi ; do 
  for GAME in $(flatpak run org.mamedev.MAME -listsource | grep ${MACHINE}.cpp | awk '{print $1}'); do
    printf "Looking at %s ... " "${GAME}"
    if ! flatpak run org.mamedev.MAME -listclones ${GAME} | awk '{print $1}' | grep -qw ${GAME}; then
      printf "parent rom, "
      INFOS=$(flatpak run org.mamedev.MAME -listxml ${GAME} | grep 'rotate=')
      ROTATE=$(printf "%s" ${INFOS} | grep 'rotate=' | cut -d '"' -f6)
      if [[ ${ROTATE} -gt 0 ]]; then 
        printf "vertical\n"
        if [ ${MACHINE} == 'naomi' ]; then
          EMU='Flycast'
        else
          EMU='FinalBurn Neo'
        fi
        printf "=> Linking %s in %s for %s\n" "${GAME}" "${EMU}" "${MACHINE}"
        ln -f "/home/deck/.config/retroarch/config/${EMU}/${MACHINE}-vertical.opt" "/home/deck/.config/retroarch/config/${EMU}/${GAME}.opt"
#        ln -f "/home/deck/.config/retroarch/config/${EMU}/${MACHINE}-vertical.slangp" "/home/deck/.config/retroarch/config/${EMU}/${GAME}.slangp"
      else
        printf "horizontal\n"
      fi
    else
      printf "clone, skipping\n"
    fi
  done
done
