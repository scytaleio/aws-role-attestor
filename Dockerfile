from golang:1.9.2-stretch

RUN apt-get update && apt-get -y install \
    curl unzip git build-essential

RUN curl https://glide.sh/get | sh

RUN mkdir -p /go/src/github.com/spiffe/aws-role-attestor

WORKDIR /go/src/github.com/spiffe/aws-role-attestor
