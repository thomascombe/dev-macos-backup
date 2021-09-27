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

.DEFAULT_GOAL := help
help:
	@grep -E '(^[a-zA-Z_-]+:.*?##.*$$)|(^##)' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[32m%-30s\033[0m %s\n", $$1, $$2}' | sed -e 's/\[32m##/[33m/'
.PHONY: help
