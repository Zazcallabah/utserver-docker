FROM gcr.io/google-containers/ubuntu-slim:0.14

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
  && apt-get install -y --no-install-recommends curl sudo wget ca-certificates util-linux software-properties-common \
  && rm -fr /var/lib/apt/lists/* \
  && rm -fr /var/cache/apt/* \
  && rm -fr /tmp/*

ADD ./utserver.tar.gz /

RUN mv /utorrent-server-alpha-v3_3 /opt/utorrent\
  && chmod +x /opt/utorrent/utserver

COPY ./utserver.conf /opt/utorrent

ENTRYPOINT ["/opt/utorrent/utserver" , "-settingspath" , "/opt/utorrent/" , "-configfile", "/opt/utorrent/utserver.conf"]
