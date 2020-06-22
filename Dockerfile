FROM node:12-alpine
MAINTAINER fithwum

ENV UID=99
ENV GUID=100

RUN mkdir -p /foundry \
	&& mkdir -p /foundry/fvtt \
	&& mkdir -p /foundry/data

WORKDIR /foundry

EXPOSE 30000
CMD [ "node", "fvtt/resources/app/main.js", "--headless", "--dataPath=/foundry/data" ]