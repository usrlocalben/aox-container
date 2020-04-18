#!/bin/bash

USER_ID=${LOCAL_USER_ID:-9001}
useradd -u $USER_ID -o -p ! -m aox
export HOME=/home/aox

CONF=/usr/local/archiveopteryx/archiveopteryx.conf

/venv/bin/python3 /genconfig.py

chown aox:aox $CONF
chmod 0640 $CONF

exec "$@"
