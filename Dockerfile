FROM rclone/rclone:latest
RUN apk add --no-cache bash curl su-exec supercronic

# Copy entrypoint script
COPY /docker-entrypoint.sh /bin/entrypoint.sh
RUN chmod +x /bin/entrypoint.sh
# Set entrypoint
ENV PUID=1000 PGID=1000 HOME=/data
ENTRYPOINT ["/bin/entrypoint.sh", "supercronic"]
# Set default argument
CMD ["/etc/supercronic/crontab"]
