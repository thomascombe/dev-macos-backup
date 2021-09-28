.PHONY: up
init: ## init backup
	sh ./scripts/init.sh

crontab: init
	sh ./scripts/crontab.sh

hosts: init
	sh ./scripts/hosts.sh

projects: init
	sh ./scripts/projects.sh

projectszip: init
	sh ./scripts/projects-zip.sh

brewlist: init
	sh ./scripts/brewlist.sh

database: init
	sh ./scripts/database.sh

full: crontab hosts projects-zip brewlist database
speed: crontab hosts projects brewlist database

## restore

crontab-restore: init
	sh ./scripts/crontab.sh restore

hosts-restore: init
	sh ./scripts/hosts.sh restore

projects-restore: init
	sh ./scripts/projects.sh restore

projectszip-restore: init
	sh ./scripts/projects-zip.sh restore

brewlist-restore: init
	sh ./scripts/brewlist.sh restore

database-restore: init
	sh ./scripts/database.sh restore

full-restore: crontab-restore hosts-restore projects-zip-restore brewlist-restore database-restore
speed-restore: crontab-restore hosts-restore projects-restore brewlist-restore database-restore

.DEFAULT_GOAL := help
help:
	@grep -E '(^[a-zA-Z_-]+:.*?##.*$$)|(^##)' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[32m%-30s\033[0m %s\n", $$1, $$2}' | sed -e 's/\[32m##/[33m/'
.PHONY: help
