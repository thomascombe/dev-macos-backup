source ./includes/variables.sh

backup() {
  rm "$backupFolder/brewlist/Brewfile.old"
  mv "$backupFolder/brewlist/Brewfile" "$backupFolder/brewlist/Brewfile.old"
  mkdir -p "$backupFolder/brewlist"
  cd "$backupFolder/brewlist" && brew bundle dump
}

restore() {
  cd "$backupFolder/brewlist"
  if [[ ! -f "Brewfile" ]]; then
      echo "Brewfile not exist."
      return 1
  fi

  brew bundle
}

callArgumentMethod $1
