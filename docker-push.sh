#!/usr/bin/env bash
set -e

echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin
VERSION=$(docker run cargomedia/gearman --version | perl -0pe 's/.*gearmand ([\d\.]+).*/$1/s')
docker tag cargomedia/gearman:latest cargomedia/gearman:${VERSION}
docker push cargomedia/gearman:latest
docker push cargomedia/gearman:${VERSION}
