VERSION = 5.16.0.187

IMAGE_NAME = centos7-mono
REPO_HOST = docker.io
REPO_NAME = bryanayers
LOCAL_REPO_PORT = 5000


.PHONY: build clean push-local push-remote tag

default: build tag


build: Dockerfile
	docker pull centos:7
	docker build \
		--build-arg VERSION=$(VERSION) \
		-t $(REPO_HOST)/$(REPO_NAME)/$(IMAGE_NAME):$(VERSION) \
		-f Dockerfile \
		.


clean:
	docker rmi $(REPO_HOST)/$(REPO_NAME)/$(IMAGE_NAME):latest
	docker rmi $(REPO_HOST)/$(REPO_NAME)/$(IMAGE_NAME):$(VERSION)
	docker rmi localhost:$(LOCAL_REPO_PORT)/$(IMAGE_NAME)
	docker rmi localhost:$(LOCAL_REPO_PORT)/$(IMAGE_NAME):$(VERSION)

tag:
	docker tag $(REPO_HOST)/$(REPO_NAME)/$(IMAGE_NAME):$(VERSION) $(REPO_HOST)/$(REPO_NAME)/$(IMAGE_NAME):latest
	docker tag $(REPO_HOST)/$(REPO_NAME)/$(IMAGE_NAME):$(VERSION) $(REPO_HOST)/incendonet/$(IMAGE_NAME):latest
	docker tag $(REPO_HOST)/$(REPO_NAME)/$(IMAGE_NAME):$(VERSION) $(REPO_HOST)/incendonet/$(IMAGE_NAME):$(VERSION)

tag-local:
	docker tag $(REPO_HOST)/$(REPO_NAME)/$(IMAGE_NAME):latest localhost:$(LOCAL_REPO_PORT)/$(IMAGE_NAME)
	docker tag $(REPO_HOST)/$(REPO_NAME)/$(IMAGE_NAME):latest localhost:$(LOCAL_REPO_PORT)/$(IMAGE_NAME):$(VERSION)

push-local: tag
	docker push localhost:$(LOCAL_REPO_PORT)/$(IMAGE_NAME):latest
	docker push localhost:$(LOCAL_REPO_PORT)/$(IMAGE_NAME):$(VERSION)

push-remote: tag
	docker push $(REPO_HOST)/$(REPO_NAME)/$(IMAGE_NAME):latest
	docker push $(REPO_HOST)/$(REPO_NAME)/$(IMAGE_NAME):$(VERSION)
	docker push $(REPO_HOST)/incendonet/$(IMAGE_NAME):latest
	docker push $(REPO_HOST)/incendonet/$(IMAGE_NAME):$(VERSION)
