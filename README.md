# teldrive-rclone-docker

- Teldrive를 FTP로 사용하기!

```shell
rclone serve ftp teldrive: --vfs-cache-max-age=24h --vfs-read-chunk-size=12M --vfs-read-chunk-streams=20 --teldrive-threaded-streams=1 --vfs-cache-mode=full --vfs-cache-max-size=1G --user $USER --pass $PASSWD --addr=0.0.0.0:2121 --no-modtime --links -v
```
기본적인 명령어입니다.
본인의 상황에 맞게끔 변경하여 사용하시면 됩니다.

## Docker
- env
```env
USER=user_name
PASSWD=password
CACHE_SIZE=1G
PORT=2121
```
- volume
```java
/path/your/rclone.conf:/rclone.conf
/path/your/cache:/cache
```
- Network
```env
21:2121
30000-32000:30000-32000 #Passive port
```

## conf
```conf
[teldrive]
type = teldrive
api_host = your_teldrive_url
access_token = your_token
chunk_size = 500M # 100M to 2000M
upload_concurrency = 10 # < bot_count
encrypt_files = true
random_chunk_name = true
```
