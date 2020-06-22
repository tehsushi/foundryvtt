FROM alpine:latest
MAINTAINER fithwum

ENV UID=99
ENV GUID=100

# Install dependencies and folder creation
RUN apk update && apk add --no-cache ca-certificates libstdc++ su-exec bash-completion tar nodejs npm \
	&& mkdir -p /foundry /ftemp /ftemp/fvtt /ftemp/data \
	&& chmod 777 -R /foundry \
	&& chown 99:100 -R /foundry

# directory where data is stored
VOLUME /foundry
RUN mv /ftemp/fvtt /foundry/fvtt \
	&& mv /ftemp/data /foundry/data

# TCP Port
EXPOSE 30000

# Run command
CMD [ "node", "fvtt/resources/app/main.js", "--headless", "--dataPath=/foundry/data" ]
