APKO_TAG := latest-$(shell uname -m)
ARCHIVE := workspace.tar
DIR := $(shell pwd)
NAME := workspace
TAG := latest

.PHONY: build
build:
	docker build -t $(NAME):$(TAG) -f Dockerfile .

.PHONY: workspace
workspace: build
	docker run --rm -it -v $(shell pwd):$(DIR) -w $(DIR) $(NAME):$(TAG)

.PHONY: apko-build
apko-build:
	apko build workspace.apko.yaml $(NAME):$(TAG) $(ARCHIVE)
	docker load < $(ARCHIVE)

.PHONY: apko-workspace
apko-workspace: apko-build
	docker run --rm -it -v $(shell pwd):$(DIR) -w $(DIR) $(NAME):$(APKO_TAG)
