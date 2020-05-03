[circus]
check_delay = 5

[watcher:aox-0]
cmd = /usr/local/archiveopteryx/sbin/archiveopteryx
args = 
  -s imap-address=fd/$(circus.sockets.imap)
  -s imaps-address=fd/$(circus.sockets.imaps)
  -s lmtp-address=fd/$(circus.sockets.lmtp)
  -s smtp-submit-address=fd/$(circus.sockets.submit)
  -s managesieve-address=fd/$(circus.sockets.sieve)
  -s statistics-address=0.0.0.0
  -s statistics-port=17220
use_sockets = True
warmup_delay = 0
# numprocesses = {AOX_CONCURRENCY}

# stderr_stream.class = TimedRotatingFileStream
# stderr_stream.filename = /log/archiveopteryx-0-err.log
# stderr_stream.time_format = %%Y-%%m-%%d %%H:%%M:%%S
# stderr_stream.utc = True
# stderr_stream.rotate_when = D
# stderr_stream.rotate_interval = 1

stderr_stream.class = FileStream
stderr_stream.max_bytes = 5000000
stderr_stream.backup_count = 7
stderr_stream.filename = /log/aox-0.log


[watcher:aox-1]
cmd = /usr/local/archiveopteryx/sbin/archiveopteryx
args = 
  -s imap-address=fd/$(circus.sockets.imap)
  -s imaps-address=fd/$(circus.sockets.imaps)
  -s lmtp-address=fd/$(circus.sockets.lmtp)
  -s smtp-submit-address=fd/$(circus.sockets.submit)
  -s managesieve-address=fd/$(circus.sockets.sieve)
  -s statistics-address=0.0.0.0
  -s statistics-port=17221
use_sockets = True
warmup_delay = 0
# numprocesses = {AOX_CONCURRENCY}

# stderr_stream.class = TimedRotatingFileStream
# stderr_stream.filename = /log/archiveopteryx-1-err.log
# stderr_stream.time_format = %%Y-%%m-%%d %%H:%%M:%%S
# stderr_stream.utc = True
# stderr_stream.rotate_when = D
# stderr_stream.rotate_interval = 1

stderr_stream.class = FileStream
stderr_stream.max_bytes = 5000000
stderr_stream.backup_count = 7
stderr_stream.filename = /log/aox-1.log

[socket:imap]
host = 0.0.0.0
port = 143
so_reuseport = False

[socket:lmtp]
host = 0.0.0.0
port = 2026
so_reuseport = False

[socket:imaps]
host = 0.0.0.0
port = 993
so_reuseport = False

[socket:submit]
host = 0.0.0.0
port = 587
so_reuseport = False

[socket:sieve]
host = 0.0.0.0
port = 4190
so_reuseport = False
