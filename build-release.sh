#!/bin/bash
docker build --no-cache -t hackinglab/alpine-ssh-mitm:$1.0 -t hackinglab/alpine-ssh-mitm:$1 -t hackinglab/alpine-ssh-mitm:latest -f Dockerfile .

docker push hackinglab/alpine-ssh-mitm
docker push hackinglab/alpine-ssh-mitm:$1
docker push hackinglab/alpine-ssh-mitm:$1.0
