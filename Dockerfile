FROM alpine:latest
MAINTAINER fithwum

ENV UID=99
ENV GUID=100

RUN apk update && apk add --no-cache ca-certificates libstdc++ su-exec bash-completion tar nodejs npm \
	&& mkdir -p /foundry \
	&& mkdir -p /foundry/fvtt \
	&& mkdir -p /foundry/data

WORKDIR /foundry

EXPOSE 30000
CMD [ "node", "fvtt/resources/app/main.js", "--headless", "--dataPath=/foundry/data" ]