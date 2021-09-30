#!/usr/bin/env bash

availableArguments=(backup restore)

backupFolder='/Users/thomascombe/macBackup'

projectsFolder='/Users/thomascombe/PhpstormProjects'

if [ -f .env ]
then
   export $(cat .env | xargs)
fi

PATH="/usr/local/bin:/usr/bin:/bin:$CUSTOM_PATH"

source ./includes/functions.sh
