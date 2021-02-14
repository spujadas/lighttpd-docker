# Dockerfile for lighttpd

FROM alpine


RUN apk add --update --no-cache \
	lighttpd \
	lighttpd-mod_auth \
	bash \
  && rm -rf /var/cache/apk/*

COPY etc/lighttpd/* /etc/lighttpd/
COPY start.sh /usr/local/bin/

EXPOSE 80

VOLUME /var/www/localhost/htdocs
VOLUME /etc/lighttpd

CMD ["start.sh"]
