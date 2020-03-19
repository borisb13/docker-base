FROM ubuntu:16.04

MAINTAINER Best IT Guys

ARG DOCKER_IMAGE_VERSION=unknown

RUN cp /bin/bash /bin/sh

WORKDIR /tmp

COPY init-docker /usr/bin/init-docker
COPY start-service /usr/bin/start-service
RUN chmod +x /usr/bin/start-service

RUN apt-get update

# Set environment variables.
# ENV WATCH_DIR_NAME="watch"
    
# Metadata.
LABEL \
      org.label-schema.name="docker-base" \
      org.label-schema.description="Base docker container" \
      org.label-schema.version="$DOCKER_IMAGE_VERSION" \
      org.label-schema.vcs-url="https://github.com/borisb13/docker-base" \
      org.label-schema.schema-version="1.0"

ENTRYPOINT ["/usr/bin/init-docker"]
