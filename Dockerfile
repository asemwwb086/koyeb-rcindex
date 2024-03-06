FROM rclone/rclone
WORKDIR /app/

COPY dark.html serve.sh .
RUN chmod +x serve.sh
RUN mv /usr/local/bin/rclone /usr/bin/triker

ENTRYPOINT ["./serve.sh"]