FROM node:12-alpine
MAINTAINER fithwum

ENV UID=99
ENV GUID=100

RUN mkdir -p /foundry/fvtt
RUN mkdir -p /foundry/data

WORKDIR /foundry/fvtt

EXPOSE 30000
CMD [ "node", "resources/app/main.js", "--headless", "--dataPath=/foundry/data" ]