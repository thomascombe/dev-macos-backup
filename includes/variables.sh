#!/usr/bin/env bash

backupFolder='/Users/thomascombe/macBackup'

projectsFolder='/Users/thomascombe/PhpstormProjects'

if [ -f .env ]
then
   export $(cat .env | xargs)
fi
