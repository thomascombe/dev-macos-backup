#!/bin/bash

source ./includes/variables.sh

dir="$backupFolder/sshkeys"

backup() {
  mkdir -p "$dir"
  zip "$dir/keys.zip" ~/.ssh/* -P "$ZIP_PASSWORD" -j
}

restore() {
  mkdir -p ~/.ssh
  cd "$dir" && unzip -P "$ZIP_PASSWORD" keys.zip -d ~/.ssh
}

callArgumentMethod $1
