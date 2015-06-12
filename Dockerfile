FROM alpine:3.1
MAINTAINER Widi Harsojo <https://github.com/wharsojo>

ENV DOCKER_COMPOSE_VERSION 1.3.0rc2

RUN apk --update add py-pip \
  && pip install -U docker-compose==${DOCKER_COMPOSE_VERSION}

# This container is a chrooted docker-compose
WORKDIR /app
ENTRYPOINT ["/usr/bin/docker-compose"]
CMD ["--version"]