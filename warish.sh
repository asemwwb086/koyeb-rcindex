#!/bin/sh

wget -qO rclone.conf $CONF

rclone listremotes --config rclone.conf \
    | while read line ; do echo "${line%:}"=$line ; done \
    | echo -e "\n[combine]\ntype = combine\nupstreams = $(tr "\n" " ")" >> rclone.conf

if [ -n "${USER}" ] && [ -n "${PASS}" ]; then

rclone serve http combine: \
    --config=rclone.conf \
    --template=dark.html \
    --addr=:$PORT \
    --user=$USER \
    --pass=$PASS \
    --read-only

else

rclone serve http combine: \
    --config=rclone.conf \
    --template=dark.html \
    --addr=:$PORT \
    --read-only

fi
