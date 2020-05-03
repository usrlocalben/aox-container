db-address = {AOX_DB_ADDR}
db-name = {AOX_DB_DATABASE}
db-port = {AOX_DB_PORT}
db-user = "{AOX_DB_USER_LOGIN}"
db-password = "{AOX_DB_USER_SECRET}"

hostname = {AOX_HOSTNAME}
undelete-time = {AOX_UNDELETE_TIME}
smarthost-address = {AOX_SMARTHOST_ADDR}
logfile = stderr
log-level = {AOX_LOG_LEVEL}
server-processes = 1
memory-limit = {AOX_MEMORY_LIMIT}

allow-plaintext-access = never
tls-certificate = /usr/local/archiveopteryx/cert.pem


use-ipv6 = false
use-pop = false
use-pops = false
use-imap = true
use-imaps = true
use-lmtp = true
use-smtp = false
use-smtps = false
use-smtp-submit = true
use-sieve = true
use-statistics = true

security = true
