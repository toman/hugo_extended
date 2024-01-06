#!/bin/bash
# Usage: ./build.sh MAJOR.MINOR.PATCH HUGO_PLATFORM
#docker buildx build . --platform=linux/amd64 --build-arg NODE_VERSION=latest --build-arg HUGO_PLATFORM=linux-amd64 -t lillibolero/hugo_extended:$1 -t lillibolero/hugo_extended:latest
docker build . --build-arg NODE_VERSION=latest --build-arg HUGO_PLATFORM=${2:-Linux-64bit} -t lillibolero/hugo_extended:$1 -t lillibolero/hugo_extended:latest
docker push lillibolero/hugo_extended:$1
docker push lillibolero/hugo_extended:latest