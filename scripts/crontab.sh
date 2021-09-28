source ./includes/variables.sh

dir="$backupFolder/crontab"

backup() {
  mkdir -p "$dir"
  crontab -l > "$dir/crontab.backup"
}

restore() {
  cd "$dir"
  if [[ ! -f "crontab.backup" ]]; then
      echo "crontab.backup not exist."
      return 1
  fi
  crontab "crontab.backup"
}

callArgumentMethod $1
