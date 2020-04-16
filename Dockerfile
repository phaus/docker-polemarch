FROM python:3.6-alpine as base

FROM  vstconsulting/polemarch:1.6.2

COPY settings.ini /root/settings.ini.dist
COPY start.sh /start.sh
COPY supervisord.conf /etc/supervisord.conf

RUN set -x \
  && apk add --update --no-cache git sshpass libuuid mailcap dcron supervisor \
  && mkdir -p /var/run/polemarch /data \
  && chmod +x /start.sh

VOLUME ["/data"]

EXPOSE 8080

ENTRYPOINT ["/start.sh"]
