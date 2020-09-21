# Dockerfile for lighttpd

FROM alpine

ENV LIGHTTPD_VERSION=1.4.55-r1

RUN apk add --update --no-cache \
	lighttpd=${LIGHTTPD_VERSION} \
	lighttpd-mod_auth \
  && rm -rf /var/cache/apk/*

COPY etc/lighttpd/* /etc/lighttpd/
COPY start.sh /usr/local/bin/

EXPOSE 80

VOLUME /var/www/localhost
VOLUME /etc/lighttpd

CMD ["start.sh"]
