#!/usr/bin/env sh

LOGFILE=${PWD}/${0}.log
MEDIAPATH=/home/deck/Emulation/tools/downloaded_media

echo -e "=== list of problematic media files ===\n" > ${LOGFILE}

for HW in ${MEDIAPATH}/*
do
  for MEDIATYPE in ${HW}/*
  do
    for FICH in ${MEDIATYPE}/*.*
    do
      if ! ffprobe "${FICH}" >/dev/null 2>/dev/null
      then
        echo "${FICH}" >> "${LOGFILE}"
      fi
    done
  done
done
