FROM debian:latest

LABEL maintainer="Marcus Krause <36983163+MK-2001@users.noreply.github.com>"

ARG MOSQVER
ENV MOSQVER ${MOSQVER:-1.4.15}

ENV DEBIAN_FRONTEND noninteractive

RUN     mkdir -p /usr/local/src
WORKDIR          /usr/local/src

RUN     wget http://mosquitto.org/files/source/mosquitto-$MOSQVER.tar.gz
RUN     tar xzf ./mosquitto-$MOSQVER.tar.gz
WORKDIR /usr/local/src/mosquitto-$MOSQVER
RUN     make && make install

RUN     adduser --system --disabled-password --disabled-login mq
USER    mq

EXPOSE 1883

CMD ["/usr/local/sbin/mosquitto"]
