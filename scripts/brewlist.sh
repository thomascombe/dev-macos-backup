source ./includes/variables.sh

rm "$backupFolder/brewlist/Brewfile.old"
mv "$backupFolder/brewlist/Brewfile" "$backupFolder/brewlist/Brewfile.old"
mkdir -p "$backupFolder/brewlist"
cd "$backupFolder/brewlist" && brew bundle dump


# to restore, run `brew bundle` in folder
