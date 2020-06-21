FROM node:12-alpine
MAINTAINER fithwum

ENV UID=99
ENV GUID=100

RUN deluser node
RUN adduser -r -u foundry -G 99 100

USER foundry

RUN mkdir -p /home/foundry/fvtt
RUN mkdir -p /home/foundry/data

WORKDIR /home/foundry/fvtt

EXPOSE 30000
CMD [ "node", "resources/app/main.js", "--headless", "--dataPath=/home/foundry/data" ]