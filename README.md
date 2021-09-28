# Scripts to backup your Dev MacOS

# Set crontab
```crontab
0 */2 * * * cd ~/PhpstormProjects/dev-macos-backup && make speed > ~/PhpstormProjects/dev-macos-backup/logs.log 2>&1
0 13,17,19 * * * cd ~/PhpstormProjects/dev-macos-backup && make full > ~/PhpstormProjects/dev-macos-backup/logs.log 2>&1
```

# Add gitignore

In your backup folder add `.gitignore` 

```
projects
```

# Backup `$backupFolder` folder in another storage.

# TODO
* [ ] Alert on error
* [ ] Backup on NAS with Kopia
