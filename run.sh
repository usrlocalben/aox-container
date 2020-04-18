#!/bin/bash
docker run --rm -ti \
    -e AOX_DB_ADDR=postgres.db.addr \
    -e AOX_DB_DATABASE=aox_db_name \
    -e AOX_DB_PORT=5432 \
    -e AOX_DB_LOGIN=aoxuser \
    -e AOX_DB_SECRET=aoxpass \
    -e AOX_HOSTNAME=mail.example.com \
    -e AOX_SMARTHOST_ADDR=upstream.mta.example.com \
    -e AOX_UNDELETE_TIME=7 \
    -e AOX_MEMORY_LIMIT=500 \
    -e AOX_CONCURRENCY=4 \
    -v /path/to/my/cert.pem:/usr/local/archiveopteryx/cert.pem \
    -p 143 \
    -p 587 \
    -p 993 \
    -p 2026 \
    -p 4190 \
    rqdq/aox $*
