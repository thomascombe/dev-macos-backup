source ./includes/variables.sh

dir="$backupFolder"

echo "$(date +%s)" > "$dir/local_lastdate.txt"

commit

#if [[ $SLACK_ENABLED = "true" ]]; then
#    curl -X POST --data-urlencode "payload={\"channel\": \"$SLACK_CHANNEL\", \"username\": \"$MACHINE_NAME Backup\", \"text\": \"Backup ended!\", \"icon_emoji\": \":heavy_check_mark:\"}" $SLACK_WEBHOOK
#fi
