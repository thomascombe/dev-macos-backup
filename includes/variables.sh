#!/usr/bin/env bash

availableArguments=(backup restore)

backupFolder='/Users/thomascombe/macBackup'

projectsFolder='/Users/thomascombe/PhpstormProjects'

if [ -f .env ]
then
   export $(cat .env | xargs)
fi

source ./includes/functions.sh
