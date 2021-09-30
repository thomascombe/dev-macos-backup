#!/bin/bash

source ./includes/variables.sh

dir="$backupFolder/brewlist"

backup() {
  rm "$dir/Brewfile.old"
  mv "$dir/Brewfile" "$backupFolder/brewlist/Brewfile.old"
  mkdir -p "$dir"
  cd "$dir" && brew bundle dump
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
