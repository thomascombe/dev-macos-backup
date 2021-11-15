#!/bin/bash

if [ -f .env ]
then
   export $(cat .env | xargs)
fi

if [ ! -d "/Volumes/home/MacOSThomascombeWQ/macBackup" ]; then
  echo 'Volume not mounted'
  exit 1
fi


open "$SMB_PATH"
/usr/local/bin/kopia snapshot create /Users/thomascombe/macBackup
echo "$(date +%s)" > /Volumes/home/MacOSThomascombeWQ/macBackup_lastdate.txt


