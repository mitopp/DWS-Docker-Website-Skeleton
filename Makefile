# variables
NULL :=
TAB := $(NULL)	$(NULL)
NL :=

# executables
ifeq ($(OS),Windows_NT)
	DOCKER 	= docker
	COMPOSE = docker compose
else
	DOCKER 	= $(shell which docker)
	COMPOSE = $(shell which docker compose)
endif

# targets
.PHONY: help build down list logs start stop up

###> general ###
help: all
	$(info $(NL))
	$(info $(TAB)Usage:  make [OPTIONS] COMMAND)
	$(info $(NL))
	$(info $(TAB)Options:)
	$(info $(TAB)$(TAB)c=string$(TAB)$(TAB)Specify an alternate container. (default: "php"))
	$(info $(TAB)$(TAB)e=string$(TAB)$(TAB)Specify an alternate environment. (default: "dev"))
	$(info $(TAB)$(TAB)l=string$(TAB)$(TAB)Number of lines to show. (default: "10"))
	$(info $(NL))
	$(info $(TAB)Predefined commands:)
	$(info $(TAB)$(TAB)build$(TAB)$(TAB)$(TAB)Build services. (no cache))
	$(info $(TAB)$(TAB)down$(TAB)$(TAB)$(TAB)Stop and remove containers, networks, etc.)
	$(info $(TAB)$(TAB)help$(TAB)$(TAB)$(TAB)Outputs this help screen.)
	$(info $(TAB)$(TAB)list$(TAB)$(TAB)$(TAB)List running compose projects.)
	$(info $(TAB)$(TAB)logs$(TAB)$(TAB)$(TAB)View output from containers.)
	$(info $(TAB)$(TAB)start$(TAB)$(TAB)$(TAB)Start all services.)
	$(info $(TAB)$(TAB)stop$(TAB)$(TAB)$(TAB)Stop all services.)
	$(info $(TAB)$(TAB)up$(TAB)$(TAB)$(TAB)Create and start containers. (detached))
	$(info $(NL))
	$(info $(TAB)Abstract helper commands: (* Sub command must be masked))
	$(info $(TAB)$(TAB)docker/*$(TAB)$(TAB)Executes a Docker command.)
	$(info $(TAB)$(TAB)compose/*$(TAB)$(TAB)Executes a Docker Compose command.)
	$(info $(TAB)$(TAB)exec/*$(TAB)$(TAB)$(TAB)Executes a command on the shell in a container.)
	$(info $(NL))
	$(info $(TAB)Variables: (for debugging purposes))
	$(info $(TAB)$(TAB)Environment (e)$(TAB)$(TAB)$(e))
	$(info $(TAB)$(TAB)Container (c)$(TAB)$(TAB)$(c))
	$(info $(TAB)$(TAB)Length (l)$(TAB)$(TAB)$(l))
	$(info $(NL))

build: all
	make compose/"build --pull --no-cache"

down: all
	make compose/"down --remove-orphans"

list: all
	make compose/"ls"

logs: all
	make compose/"logs --tail $(l)"

start: all
	make compose/"start"

stop: all
	make compose/"stop"

up: all
	make compose/"up --detach"
###< general ###

###> abstract ###
docker/%: all
	$(DOCKER) $*

compose/%: all
	$(COMPOSE) $(ARGS) $*

exec/%: all
	make compose/"exec -it $(c) $*"
###< abstract ###

###> helper ###
all:
$(info Compile arguments...)

$(eval c ?= php)
$(eval e ?= dev)
$(eval l ?= 10)

# compose arguments
ARGS = --file docker-compose.yml
ifneq ($(e), dev)
	ARGS += --file docker-compose.$(e).yml
else
	ARGS += --file docker-compose.override.yml
endif
ifneq ("$(wildcard .env)", "")
	ARGS += --env-file .env
endif
ifneq ("$(wildcard .env.$(e))", "")
	ARGS += --env-file .env.$(e)
endif
###< helper ###
