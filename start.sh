#!/bin/sh

# this launcher script tails the access and error logs
# to the stdout and stderr, so that `docker logs -f lighthttpd` works.

tail -F /var/log/lighttpd/access.log 2>/dev/null &
tail -F /var/log/lighttpd/error.log 2>/dev/null 1>&2 &
exec lighttpd -D -f /etc/lighttpd/lighttpd.conf
