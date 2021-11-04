#!/bin/bash
docker build --no-cache -t hackinglab/alpine-ssh-mitm:3.2.0 -t hackinglab/alpine-ssh-mitm:3.2 -t hackinglab/alpine-ssh-mitm:latest -f Dockerfile .

