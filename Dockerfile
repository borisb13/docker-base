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
    chmod +x /root/start-service && \
    apt-get update && \
    apt-get clean && \
	apt-get -y update && 
	apt-get install -y locales curl openvpn zip unzip bridge-utils && \
    mkdir -p /dev/net && \
    mknod /dev/net/tun c 10 200 && \
    chmod 600 /dev/net/tun
    
VOLUME /config
    
# Metadata.
LABEL \
      org.label-schema.name="docker-base" \
      org.label-schema.description="Base docker container" \
      org.label-schema.version="$DOCKER_IMAGE_VERSION" \
      org.label-schema.vcs-url="https://github.com/borisb13/docker-base" \
      org.label-schema.schema-version="1.0"

ENTRYPOINT ["/root/init-docker"]
