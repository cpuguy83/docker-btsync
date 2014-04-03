FROM debian:jessie
ENV DEBIAN_FRONTEND noninteractive
ADD btsync.tar.gz /usr/local/bin
ADD btsync.conf /data/
RUN chmod 777 /usr/local/bin/btsync
RUN useradd btsync
RUN mkdir -p /data/sync && chown -R btsync.btsync /data
USER btsync
VOLUME ["/data"]
EXPOSE 3369 3369/udp 8080
ENTRYPOINT ["/usr/local/bin/btsync", "--nodaemon"]
CMD ["--config", "/data/btsync.conf"]
