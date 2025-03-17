FROM teldrive/rclone:latest

ENTRYPOINT ["rclone", "serve", "ftp", "teldrive:", "--vfs-cache-max-age=24h", "--vfs-read-chunk-size=12M", "--vfs-read-chunk-streams=20", "--teldrive-threaded-streams=1", "--vfs-cache-mode=full", "--vfs-cache-max-size=1G", "--user=$USER", "--pass=$PASSWD", "--addr=0.0.0.0:21", "-v"]
