FROM rclone/rclone
WORKDIR /warish/

COPY dark.html warish.sh .

ENTRYPOINT ["sh", "warish.sh"]
