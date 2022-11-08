#!/bin/bash

case `uname -m` in 

	x86_64)
		echo "x86_64"
		docker buildx build --platform linux/amd64 --no-cache -t hackinglab/alpine-ssh-mitm-legancy:amd64-3.2.0 -t hackinglab/alpine-ssh-mitm-legancy:amd64-3.2 -t hackinglab/alpine-ssh-mitm-legancy:amd64-latest -f Dockerfile .
	;;

	aarch64)
		echo "aarch64"
		docker buildx build --platform linux/arm64 --no-cache -t hackinglab/alpine-ssh-mitm-legancy:arm64-3.2.0 -t hackinglab/alpine-ssh-mitm-legancy:arm64-3.2 -t hackinglab/alpine-ssh-mitm-legancy:arm64-latest -f Dockerfile .
	;;

	*)
		echo "OS not found"
	;;
esac
