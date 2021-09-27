source ./includes/variables.sh

mkdir -p "$backupFolder/crontab"
crontab -l > "$backupFolder/crontab/crontab.backup"
