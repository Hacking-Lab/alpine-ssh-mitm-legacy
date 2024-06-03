#!/bin/bash

docker buildx build --platform linux/arm64,linux/amd64 -t hackinglab/alpine-ssh-mitm-legacy:latest . --push
docker buildx build --platform linux/arm64,linux/amd64 -t hackinglab/alpine-ssh-mitm-legacy:$1  . --push
docker buildx build --platform linux/arm64,linux/amd64 -t hackinglab/alpine-ssh-mitm-legacy:$1.0 . --push

