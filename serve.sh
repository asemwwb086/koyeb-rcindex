#!/bin/sh

wget -qO rclone.conf $CONFIG_URL

triker listremotes --config rclone.conf \
    | while read line ; do echo "${line%:}"=$line ; done \
    | echo -e "\n[combine]\ntype = combine\nupstreams = $(tr "\n" " ")" >> rclone.conf

if [ -n "${USERNAME}" ] && [ -n "${PASSWORD}" ]; then

triker serve http combine: \
    --config=rclone.conf \
    --addr=:$PORT \
    --user=$USERNAME \
    --pass=$PASSWORD \
    --buffer-size=64M \
    --template=dark.html \
    --vfs-cache-mode=full \
    --vfs-cache-max-age=1m0s

else

triker serve http combine: \
    --config=rclone.conf \
    --addr=:$PORT \
    --buffer-size=64M \
    --template=dark.html \
    --vfs-cache-mode=full \
    --vfs-cache-max-age=1m0s

fi