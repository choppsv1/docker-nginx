#!/bin/bash

export ROOTPATH=${ROOTPATH:-/var/www/html}

envsubst < /etc/nginx.conf.in > /etc/nginx/sites-enabled/default
nginx -g "daemon off; error_log /dev/stdout info;"
