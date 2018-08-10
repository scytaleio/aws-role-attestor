docker_volume := $(PWD):/go/src/github.com/spiffe/aws-role-attestor
docker_image = spiffe/aws-role-attestor:latest

ifeq ($(SPIRE_DEV_HOST), docker)
	docker = docker run -v $(docker_volume) -it $(docker_image)
	container = container
else
	docker =
	container =
endif

cmd:
	$(docker) /bin/bash

test:
	go test $$(glide novendor)

race-test:
	go test -race $$(glide novendor)

vendor:
	glide --home .cache install

clean:
	go clean $$(glide novendor)

build:
	docker build . --tag spiffe/aws-role-attestor:latest
