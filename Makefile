all: help


REPOSITORY=matthausen

# https://marmelab.com/blog/2016/02/29/auto-documented-makefile.html
help: ## This help
	@awk 'BEGIN {FS = ":.*?## "} /^[a-z0-9A-Z_-]+:.*?## / {printf "\033[36m%-45s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

build:
	docker build -t ${REPOSITORY}/google-idp .

run: 
	docker run -p 8080:8080 ${REPOSITORY}/google-idp .

docker-push:
	docker push ${REPOSITORY}/google-idp

kill-all:
	docker kill $(docker container ls -q)

.PHONY: help build run docker-push kill-all