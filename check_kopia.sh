#!/bin/bash

###
# Environment variables
# * FILENAME

if [ -f .env ]
then
   export $(cat .env | xargs)
fi


fileName="$FILE_NAME"
lastSync=$(cat $fileName)
durationBeforeFailure=$((60*60*24*4))

currentDate="$(date +%s)"

diff=$((currentDate-$lastSync))

if (( $diff > $durationBeforeFailure )); then
  diffInDay=$((diff/24/60/60))
  curl -X POST --data-urlencode "payload={\"channel\": \"$SLACK_CHANNEL\", \"username\": \"$MACHINE_NAME Backup\", \"text\": \"Backup missing since $diffInDay days!\", \"icon_emoji\": \":warning:\"}" $SLACK_WEBHOOK
fi

