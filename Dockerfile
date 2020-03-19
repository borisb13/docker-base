FROM ubuntu:16.04

MAINTAINER Best IT Guys

ARG DOCKER_IMAGE_VERSION=unknown

WORKDIR /root

# Add files.
ADD init-docker /root/init-docker
ADD start-service /root/start-service

# Set environment variables.
ENV HOME /root

RUN chmod +x /root/init-docker && \
    chmod +x /root/start-service
    
VOLUME /config
    
# Metadata.
LABEL \
      org.label-schema.name="docker-base" \
      org.label-schema.description="Base docker container" \
      org.label-schema.version="$DOCKER_IMAGE_VERSION" \
      org.label-schema.vcs-url="https://github.com/borisb13/docker-base" \
      org.label-schema.schema-version="1.0"

ENTRYPOINT ["/root/init-docker"]
