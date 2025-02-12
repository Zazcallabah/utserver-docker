FROM alpine:latest
RUN apk update && apk add --no-cache qbittorrent-nox
ENTRYPOINT ["qbittorrent-nox"]
