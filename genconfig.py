#!/venv/bin/python
import os

cfg = {
    'AOX_CONCURRENCY': os.environ.get('AOX_CONCURRENCY', 2),
    'AOX_DB_ADDR': os.environ.get('AOX_DB_ADDR'),
    'AOX_DB_DATABASE': os.environ.get('AOX_DB_DATABASE', 'aox'),
    'AOX_DB_LOGIN': os.environ.get('AOX_DB_LOGIN', 'aox'),
    'AOX_DB_PORT': os.environ.get('AOX_DB_PORT', 5432),
    'AOX_DB_SECRET': os.environ.get('AOX_DB_SECRET', ''),
    'AOX_HOSTNAME': os.environ.get('AOX_HOSTNAME'),
    'AOX_MEMORY_LIMIT': os.environ.get('AOX_MEMORY_LIMIT', 64),
    'AOX_SMARTHOST_ADDR': os.environ.get('AOX_SMARTHOST_ADDR'),
    'AOX_UNDELETE_TIME': os.environ.get('AOX_UNDELETE_TIME', 49),
}

with open('/archiveopteryx.conf.tpl', 'r') as in_fd:
    tpl = in_fd.read()
    with open('/usr/local/archiveopteryx/archiveopteryx.conf', 'w') as out_fd:
        out_fd.write(tpl.format(**cfg))

with open('/circus.ini.tpl', 'r') as in_fd:
    tpl = in_fd.read()
    with open('/circus.ini', 'w') as out_fd:
        out_fd.write(tpl.format(**cfg))
