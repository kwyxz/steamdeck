#!/usr/bin/env sh

LOGFILE=${PWD}/${0}.log
MEDIAPATH=/home/deck/Emulation/tools/downloaded_media

echo -e "=== list of problematic video files ===\n" > ${LOGFILE}

for FICH in ${MEDIAPATH}/*/videos/*.mp4
do
  if ! ffprobe "${FICH}" >/dev/null 2>/dev/null
  then
    echo "${FICH}" >> ${LOGFILE}
  fi
done
