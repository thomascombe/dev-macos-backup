source ./includes/variables.sh

mkdir -p "$backupFolder/projects"

rsync --compress -rltvI "$projectsFolder" --exclude="node_modules" --exclude="vendor" "$backupFolder/projects"
