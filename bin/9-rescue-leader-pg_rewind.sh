
su - postgres -c 'pg_rewind -D /var/lib/postgresql/data --source-server=host=pg-blue -P'
