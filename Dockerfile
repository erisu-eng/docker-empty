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

RUN wget -qO gotty.tar.gz https://github.com/yudai/gotty/releases/latest/download/gotty_linux_amd64.tar.gz
RUN sudo tar xf gotty.tar.gz -C /usr/local/bin

ENTRYPOINT ["/usr/local/bin/gotty"]
CMD ["--permit-write","--reconnect","/bin/sh"]
#RUN whoami
#RUN tmate
#RUN curl -sSf https://sshx.io/get | sh
#RUN sshx
