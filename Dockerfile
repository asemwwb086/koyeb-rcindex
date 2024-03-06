FROM rclone/rclone
WORKDIR /app/

COPY dark.html serve.sh .
RUN chmod +x serve.sh

ENTRYPOINT ["./serve.sh"]