FROM ubuntu:16.04

MAINTAINER Best IT Guys

ARG DOCKER_IMAGE_VERSION=unknown

RUN cp /bin/bash /bin/sh

WORKDIR /root

# Add files.
ADD root/init-docker /root/init-docker
ADD root/start-service /root/start-service

RUN chmod +x /root/init-docker
RUN chmod +x /root/start-service

# Set environment variables.
ENV HOME /root

RUN apt-get update

VOLUME /config
    
# Metadata.
LABEL \
      org.label-schema.name="docker-base" \
      org.label-schema.description="Base docker container" \
      org.label-schema.version="$DOCKER_IMAGE_VERSION" \
      org.label-schema.vcs-url="https://github.com/borisb13/docker-base" \
      org.label-schema.schema-version="1.0"

ENTRYPOINT ["/root/init-docker"]
