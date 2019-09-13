#!/usr/bin/env make

REMOTE_REGISTRY = gcr.io/engineering-devops
IMAGE_NAME = mjrtoolset
TAG = $(shell cat VERSION)
LOCAL_BUILD = $(IMAGE_NAME):$(TAG)
REMOTE_IMAGE = $(REMOTE_REGISTRY)/$(LOCAL_BUILD)

release: tag
	docker push $(REMOTE_IMAGE)

tag: build
	docker tag $(LOCAL_BUILD) $(REMOTE_IMAGE)

build:
	docker build -t $(LOCAL_BUILD) .

all: tag
	@echo "tools conatiner ready at $(REMOTE_IMAGE)"
	@echo "docker run -it $(REMOTE_IMAGE) bash"
