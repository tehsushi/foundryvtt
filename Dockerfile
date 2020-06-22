FROM alpine:latest
MAINTAINER fithwum

ARG INSTALL_SCRIPT=https://raw.githubusercontent.com/fithwum/foundryvtt/master/files/Install_Script.sh

ENV UID=99
ENV GUID=100

# Install dependencies and folder creation
RUN apk update && apk add --no-cache ca-certificates libstdc++ su-exec bash-completion tar nodejs npm \
	&& mkdir -p /foundry /ftemp \
	&& chmod 777 -R /foundry \
	&& chown 99:100 -R /foundry
ADD "${INSTALL_SCRIPT}" /ftemp
RUN chmod +x /ftemp/Install_Script.sh

# directory where data is stored
WORKDIR /foundry

# TCP Port
EXPOSE 30000

# Run command
CMD [ "/ftemp/Install_Script.sh" , "node", "fvtt/resources/app/main.js", "--headless", "--dataPath=/foundry/data" ]
