[circus]
check_delay = 5

[watcher:aox]
cmd = /usr/local/archiveopteryx/sbin/archiveopteryx
args = 
  -s imap-address=fd/$(circus.sockets.imap)
  -s imaps-address=fd/$(circus.sockets.imaps)
  -s lmtp-address=fd/$(circus.sockets.lmtp)
  -s smtp-submit-address=fd/$(circus.sockets.submit)
  -s managesieve-address=fd/$(circus.sockets.sieve)
use_sockets = True
warmup_delay = 0
numprocesses = {AOX_CONCURRENCY}

[socket:imap]
host = 0.0.0.0
port = 143

[socket:lmtp]
host = 0.0.0.0
port = 2026

[socket:imaps]
host = 0.0.0.0
port = 993

[socket:submit]
host = 0.0.0.0
port = 587

[socket:sieve]
host = 0.0.0.0
port = 4190
