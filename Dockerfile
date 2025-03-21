FROM alpine:latest

RUN apk update && apk upgrade && apk add bash wget curl

RUN curl -sSL instl.vercel.app/rclone | bash

ENTRYPOINT ["/bin/sh", "-c", "rclone --config /rclone.conf serve ftp teldrive: --vfs-cache-max-age=24h --vfs-read-chunk-size=12M --vfs-read-chunk-streams=20 --teldrive-threaded-streams=1 --vfs-cache-mode=full --vfs-cache-max-size=$CACHE_SIZE --cache-dir /cache --user $USER --pass $PASSWD --addr=0.0.0.0:$PORT --no-modtime --links -v"]
