#!/bin/bash

case `uname -m` in 

	x86_64)
		echo "=============================================="
		echo "building x86_64"
		docker buildx build --platform linux/amd64 --no-cache -t hackinglab/alpine-ssh-mitm-legacy:amd64-latest -t hackinglab/alpine-ssh-mitm-legacy:amd64-$1 -t hackinglab/alpine-ssh-mitm-legacy:amd64-$1.0 -f Dockerfile.amd64 .
	;;

	aarch64)
                echo "=============================================="
                echo "building arm64"
                docker buildx build --platform linux/arm64 --no-cache -t hackinglab/alpine-ssh-mitm-legacy:arm64-latest -t hackinglab/alpine-ssh-mitm-legacy:arm64-$1 -t hackinglab/alpine-ssh-mitm-legacy:arm64-$1.0 -f Dockerfile.arm64 .
	;;

	*)
		echo "OS not found"
	;;
esac
