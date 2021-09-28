source ./includes/variables.sh

dir="$backupFolder/hosts"

backup() {
  mkdir -p "$dir"
  cat /etc/hosts > "$dir/hosts.backup"
}

restore() {
  cd "$dir"
  if [[ ! -f "hosts.backup" ]]; then
      echo "hosts.backup not exist."
      return 1
  fi
  sudo cat hosts.backup > /etc/hosts
}

callArgumentMethod $1
