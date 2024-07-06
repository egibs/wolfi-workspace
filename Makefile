NAME := workspace
ARCHIVE := $(NAME).tar
DIR := /$(NAME)
TAG := latest
APKO_TAG := $(TAG)-$(shell uname -m)

.PHONY: build
build:
	docker build -t $(NAME):$(TAG) -f Dockerfile .

.PHONY: workspace
workspace: build
	docker run --rm -it -v $(shell pwd):$(DIR):ro -w $(DIR) $(NAME):$(TAG)

.PHONY: apko-build
apko-build:
	apko build workspace.apko.yaml $(NAME):$(TAG) $(ARCHIVE)
	docker load < $(ARCHIVE)

.PHONY: apko-workspace
apko-workspace: apko-build
	docker run --rm -it -v $(shell pwd):$(DIR):ro -w $(DIR) $(NAME):$(APKO_TAG)
