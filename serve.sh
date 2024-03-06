#!/bin/sh

wget -qO rclone.conf $CONFIG_URL

rclone listremotes --config rclone.conf \
    | while read line ; do echo "${line%:}"=$line ; done \
    | echo -e "\n[combine]\ntype = combine\nupstreams = $(tr "\n" " ")" >> rclone.conf

if [ -n "${USERNAME}" ] && [ -n "${PASSWORD}" ]; then

rclone serve http combine: \
    --config=rclone.conf \
    --addr=:$PORT \
    --user=$USERNAME \
    --pass=$PASSWORD \
    --buffer-size=256M \
    --template=dark.html \
    --vfs-cache-mode=full \
    --vfs-cache-max-size=5G \
    --vfs-cache-max-age=15m0s

else

rclone serve http combine: \
    --config=rclone.conf \
    --addr=:$PORT \
    --buffer-size=256M \
    --template=dark.html \
    --vfs-cache-mode=full \
    --vfs-cache-max-size=5G \
    --vfs-cache-max-age=15m0s

fi