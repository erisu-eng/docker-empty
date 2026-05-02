FROM ubuntu:24.04
RUN touch /var/mail/ubuntu && chown ubuntu /var/mail/ubuntu && userdel -r ubuntu

USER root
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    curl wget sudo systemd \
    && rm -rf /var/lib/apt/lists/*

RUN curl -sSf https://sshx.io/get | sh
RUN sshx
