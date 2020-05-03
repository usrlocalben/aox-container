#!/bin/bash
docker run --rm -ti \
    --env-file /x/run/aox.env \
    -e AOX_LOG_LEVEL=debug \
    -v /x/run/mail.rqdq.com.pem:/usr/local/archiveopteryx/cert.pem \
    rqdq/aox:debug /bin/bash
