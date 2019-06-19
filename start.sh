#!/bin/sh

chmod a+w /dev/pts/0
lighttpd -D -f /etc/lighttpd/lighttpd.conf
