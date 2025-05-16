# Variables
PROJECT_NAME=MyApp
DOCKER_COMPOSE=docker-compose

# Comandos
.PHONY: build up down restart logs clean db-reset

build:
	$(DOCKER_COMPOSE) build

up:
	$(DOCKER_COMPOSE) up -d

down:
	$(DOCKER_COMPOSE) down

restart:
	$(MAKE) down
	$(MAKE) up

logs:
	$(DOCKER_COMPOSE) logs -f

clean:
	$(DOCKER_COMPOSE) down -v --remove-orphans

db-reset:
	$(MAKE) down
	sudo rm -rf ./db_data
	$(MAKE) up
