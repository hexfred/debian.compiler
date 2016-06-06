.PHONY: default run start deps build clean tag push

CURRENT_DIR := $(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))
IMAGE_NAME := $(notdir $(CURRENT_DIR))
DOCKER_LOGIN := $(shell echo $(USER) | tr A-Z a-z)
DOCKER_RUN_IMAGE := $(DOCKER_LOGIN)/$(IMAGE_NAME)
DOCKER_BUILD_IMAGE := $(DOCKER_LOGIN)/$(firstword $(subst ., ,$(IMAGE_NAME))).compiler
export

default: build

start: run

run:
	docker run -it --rm "$(DOCKER_RUN_IMAGE)"

deps:
	if [ -f Makefile.deps ]; then $(MAKE) -f Makefile.deps; fi

build: deps
	docker build -t "$(DOCKER_RUN_IMAGE)" .

clean:
	docker rmi "$(DOCKER_RUN_IMAGE)"
