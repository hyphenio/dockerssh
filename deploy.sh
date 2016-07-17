#!/bin/bash

if [ ! -z "$SSH_PORT" ]; then
  sed -i \
    -e "s/^#Port 22/Port $SSH_PORT/" \
    -e "s/Port 22/Port $SSH_PORT/" \
    /etc/ssh/sshd_config
fi

sed -i \
  -e 's/^#PasswordAuthentication yes/PasswordAuthentication no/' \
  -e 's/PasswordAuthentication yes/PasswordAuthentication no/' \
  /etc/ssh/sshd_config

  /usr/bin/supervisord -c /etc/supervisor/supervisord.conf