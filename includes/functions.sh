#!/usr/bin/env bash

checkArgument() {
  if [ "$1" = 'backup' ] || [ "$1" = 'restore' ]; then
    return 0
  fi

  return 1
}

callArgumentMethod() {
  argument=$1

  if [ -z "$argument" ]; then
    argument="backup"
  fi

  if checkArgument $argument === 0
  then
    $argument
  else
    echo "Invalid argument $argument"
  fi
}

commit() {
  if [ ! -d .git ]; then
    return 0
  fi;
  git add -A .
  date=$(date)
  git commit -m "$date"
}
