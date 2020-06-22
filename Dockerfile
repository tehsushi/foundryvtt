FROM alpine:latest
MAINTAINER fithwum

ARG INSTALL_FILES=https://nextcloud.fithwum.tech/index.php/s/35GF6g2ro97Etne/download

ENV PUID=99
ENV GUID=100
ENV F_VTT_VERSION=0.6.2

RUN addgroup -S 100 \
	&& adduser -S -u 99 -D foundry -G 100

# Install dependencies and folder creation
RUN apk update && apk add --no-cache ca-certificates libstdc++ su-exec bash-completion tar nodejs npm \
	&& mkdir -p /foundry /ftemp /ftemp/fvtt /foundry/fvtt /foundry/data \
	&& chmod 777 -R /foundry \
	&& chown 99:100 -R /foundry

ADD "${INSTALL_FILES}" /ftemp

RUN 

USER foundry

# directory where data is stored
VOLUME /foundry
# WORKDIR /foundry

# TCP Port
EXPOSE 30000

# Run command
CMD [ "node", "/foundry/fvtt/resources/app/main.js", "--headless", "--dataPath=/foundry/data" ]
