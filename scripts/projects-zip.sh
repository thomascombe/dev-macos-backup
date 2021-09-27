source ./includes/variables.sh

mkdir -p "$backupFolder/projects-zip"

rm "$backupFolder/projects-zip/backup.tar.gz.bak"
mv "$backupFolder/projects-zip/backup.tar.gz" "$backupFolder/projects-zip/backup.tar.gz.bak"
tar -czf "$backupFolder/projects-zip/backup.tar.gz" --exclude="node_modules" --exclude="vendor" --exclude="var/cache" --exclude="storage/framework" "$projectsFolder"
