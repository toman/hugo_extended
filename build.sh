#!/bin/bash
docker build . --build-arg NODE_VERSION=latest -t lillibolero/hugo_extended:$1
docker push lillibolero/hugo_extended:$1
docker build . --build-arg NODE_VERSION=latest -t lillibolero/hugo_extended:latest
docker push lillibolero/hugo_extended:latest