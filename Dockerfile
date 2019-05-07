FROM juliohm/ubuntu:1.0

RUN clean-install curl sudo

RUN wget -O /tmp/ut.tgz "http://download-hr.utorrent.com/track/beta/endpoint/utserver/os/linux-x64-ubuntu-13-04" \
    && tar -xzf /tmp/ut.tgz && rm -fr /tmp/ut.tgz \
    && mv /utorrent-server-alpha-v3_3 /opt/utorrent

COPY ./utserver.conf /opt/utorrent
RUN chmod +x /opt/utorrent/utserver

ENTRYPOINT ["/opt/utorrent/utserver" , "-settingspath" , "/opt/utorrent/" , "-configfile", "/opt/utorrent/utserver.conf"]
