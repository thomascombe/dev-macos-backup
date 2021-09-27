source ./includes/variables.sh

mkdir -p "$backupFolder/hosts"
cat /etc/hosts > "$backupFolder/hosts/hosts.backup"
