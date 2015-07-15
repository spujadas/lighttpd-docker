# Dockerfile for lighttpd

FROM alpine

RUN apk add --update lighttpd \
 && rm -rf /var/cache/apk/*

## workaround for bug preventing sync between VirtualBox and host
# http://serverfault.com/questions/240038/lighttpd-broken-when-serving-from-virtualbox-shared-folder
RUN echo server.network-backend = \"writev\" >> /etc/lighttpd/lighttpd.conf

EXPOSE 80

VOLUME /var/www/localhost

CMD ["lighttpd", "-D", "-f", "/etc/lighttpd/lighttpd.conf"]
