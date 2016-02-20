#!/bin/sh
# this is the dash shell

mkdir -p /tmp/nginx/conf.d

envsubst < /etc/nginx/nginx.conf.template > /tmp/nginx/nginx.conf
envsubst < /etc/nginx/conf.d/default.conf.template > /tmp/nginx/conf.d/default.conf

exec /usr/sbin/nginx -c /tmp/nginx/nginx.conf
