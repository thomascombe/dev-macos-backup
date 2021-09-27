source ./includes/variables.sh

mkdir -p "$backupFolder/projects"

rsync --compress -rltvI --ignore-existing "$projectsFolder" --exclude="node_modules" --exclude="vendor" --exclude="var/cache" --exclude="storage/framework" "$backupFolder/projects"
