FROM alpine:latest
MAINTAINER fithwum

ENV UID=99
ENV GUID=100

# Install dependencies and folder creation
RUN apk update && apk add --no-cache ca-certificates libstdc++ su-exec bash-completion tar nodejs npm \
	&& mkdir -p /foundry \
	&& mkdir -p /foundry/fvtt \
	&& mkdir -p /foundry/data

# directory where data is stored
VOLUME /foundry

# TCP Port
EXPOSE 30000

# Run command
CMD [ "node", "fvtt/resources/app/main.js", "--headless", "--dataPath=/foundry/data" ]
