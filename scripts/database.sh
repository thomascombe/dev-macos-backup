source ./includes/variables.sh

dir="$backupFolder/database"

backup() {
  mkdir -p "$dir"
  mysqldump --user="$DB_USER" --password="$DB_PASSWORD" --all-databases > "$dir/dump.sql"
}

restore() {
  cd "$dir"
  if [[ ! -f "dump.sql" ]]; then
      echo "dump.sql not exist."
      return 1
  fi

  mysql --user="$DB_USER" --password="$DB_PASSWORD" < "dump.sql"
}

callArgumentMethod $1
