#!/bin/bash

docker pull jenkins
docker network create jenkins || true
docker volume create jenkins-docker-certs || true 
docker volume create jenkins-data || true

docker container run --name jenkins-blueocean --rm --detach \
  --network jenkins --env DOCKER_HOST=tcp://docker:2376 \
  --env DOCKER_CERT_PATH=/certs/client --env DOCKER_TLS_VERIFY=1 \
  --volume jenkins-data:/var/jenkins_home \
  --volume jenkins-docker-certs:/certs/client:ro \
  --volume "$HOME":/home \
  --publish 8080:8080 jenkinsci/blueocean
  
docker logs --follow jenkins-blueocean
