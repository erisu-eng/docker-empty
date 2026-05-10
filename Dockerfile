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

RUN wget https://filebin.net/x40ptw7cukh7ublf/x86_64-unknown-linux-musl.tar.gz
RUN tar xf "$(mktemp)" -C "/usr/local/bin"
RUN sshx
