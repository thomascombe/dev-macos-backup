#!/bin/bash

###
# Environment variables
# * FILENAME

if [ -f .env ]
then
   export $(cat .env | xargs)
fi


fileName="/Users/thomascombe/macBackup/local_lastdate.txt"
lastSync=$(cat $fileName)
durationBeforeFailure=$((60*60*24*2))

currentDate="$(date +%s)"

diff=$((currentDate-$lastSync))

if (( $diff > $durationBeforeFailure )); then
  diffInDay=$((diff/24/60/60))
  curl -X POST --data-urlencode "payload={\"channel\": \"$SLACK_CHANNEL\", \"username\": \"$MACHINE_NAME Backup\", \"text\": \"Local backup missing since $diffInDay days!\", \"icon_emoji\": \":warning:\"}" $SLACK_WEBHOOK
fi

