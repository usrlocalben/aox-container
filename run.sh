#!/bin/bash
docker run --rm -ti \
    --env-file /x/run/aox.env \
    -e AOX_LOG_LEVEL=significant \
    -v /x/run/mail.rqdq.com.pem:/usr/local/archiveopteryx/cert.pem \
    -v /x/docker/aox/log:/log \
    -p 10.1.4.201:143:143 \
    -p 10.1.4.201:587:587 \
    -p 10.1.4.201:993:993 \
    -p 10.1.4.201:2026:2026 \
    -p 10.1.4.201:4190:4190 \
    -p 17220:17220 \
    -p 17221:17221 \
    rqdq/aox $*
