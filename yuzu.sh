#!/bin/sh
emuName="yuzu" #parameterize me
emufolder="$HOME/Applications" # has to be applications for ES-DE to find it

#if appimage doesn't exist fall back to flatpak.
if [[ $exe == '' ]]; then
    #flatpak
    flatpakApp=$(flatpak list --app --columns=application | grep $emuName)
    exe="/usr/bin/flatpak run "$flatpakApp
else
#make sure that file is executable
    chmod +x $exe
fi
#run the executable with the params.
#Fix first '
param="${@}"
#substituteWith='"'
#param=${param/\'/"$substituteWith"}
#Fix last ' on command
#param=$(echo "$param" | sed 's/.$/"/')
eval ${exe} -f -g "${param}"
