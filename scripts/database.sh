source ./includes/variables.sh

mkdir -p "$backupFolder/database"

mysqldump --user=""$DB_USER"" --password="$DB_PASSWORD" --all-databases > "$backupFolder/database/dump.sql"

echo $DB_USER
