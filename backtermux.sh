#!/bin/sh
echo "BACKTERMUX 1.0 27/7/2023 KOWSVC"
_DT=$(date +%Y%m%d-%H%M%S)
_CARD=$(ls -l ~/storage | grep external-1 | cut -d" " -f11 | cut -d"/" -f 3)
if [ ! "$_CARD" ]
then
  echo "External storage not avaliable"
  echo "Try: termux-setup-storage"
  exit 1
else
  cd ~
  echo "External storage: $_CARD"
  _PATHB="/storage/$_CARD/BACKUP/"
  _FILEB="termux-backup-$_DT.tar.gz"
  tar -zcf $_PATHB$_FILEB -C /data/data/com.termux/files ./home ./usr
  if [ -f $_PATHB$_FILEB ]
  then
    _SIZE=$(ls -lh $_PATHB$_FILEB | cut -d" " -f 5)
    echo "Backup completed. Size: $_SIZE"
  else
    echo "Error while writing"
    exit 1
  fi
fi
echo "END BACKTERMUX"
