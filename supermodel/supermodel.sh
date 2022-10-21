#!/usr/bin/env sh

cd /home/deck/supermodel
DYNAMIC_RES=$(DISPLAY=:0 xrandr | grep '*+' | awk '{print $1}' | tr 'x' ',')
./supermodel -res=${DYNAMIC_RES} -fullscreen -wide-screen -wide-bg -vsync -new3d -quad-rendering -new-scsp -force-feedback $1
