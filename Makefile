SHELL:=/bin/bash

VERSION=$(shell grep -o '^[0-9]\+\.[0-9]\+\.[0-9]\+' CHANGES.txt | head -n1)
VCS_BRANCH=$(shell git branch | grep ^* | awk '{ print $$2 }')

# Colors
Color_Off=\033[0m
Cyan=\033[1;36m
Red=\033[1;31m

help: ## Помощь
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

version:  ## Версия проекта
	@echo -e "${Cyan}Version:${Color_Off} $(VERSION)";

allow:
	@[ "$(VCS_BRANCH)" = 'master' -o "$(FORCE)" = 'yes' ] || \
		(echo -e '${Red}Данная операция может быть выполнена только из ветки ${Cyan}master${Color_Off}'; exit 1)

build: version ## Сборка проекта
	@echo -e '${Cyan}Сборка проекта${Color_Off}'
	@docker-compose build

start: ## Запуск приложения
	docker-compose up bot

stop: ## Остановка приложения
	docker-compose down
