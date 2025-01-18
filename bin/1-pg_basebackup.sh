
#!/bin/bash
pg_basebackup -c fast -C -P -v --slot=blue -R -h pg-red -D /var/lib/postgresql/data

chown -R postgres /var/lib/postgresql/data
chmod 750 /var/lib/postgresql/data
