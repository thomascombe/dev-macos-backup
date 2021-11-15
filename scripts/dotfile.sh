#!/bin/bash

source ./includes/variables.sh

dir="$backupFolder/dotfiles"

backup() {
  mkdir -p "$dir/dotfiles"
  mkdir -p "$dir/dump"

  cp -r "$DOT_FILES_CONFIG" "$dir/dotfiles"
  cd "$DOT_FILES_SCRIPT" && mackup backup --force
  cp -r "$DOT_FILES_DUMP_DIR" "$dir/dump"
}

restore() {
  mkdir -p "$DOT_FILES_CONFIG"
  mkdir -p "$DOT_FILES_DUMP_DIR"

  cp -r "$dir/dotfiles" "$DOT_FILES_CONFIG"
  cd "$DOT_FILES_SCRIPT" && mackup restore --force
  cp -r "$dir/dump" "$DOT_FILES_DUMP_DIR"
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
