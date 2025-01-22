#!/bin/bash

rm -rf /var/log/postgresql/data/*
mkdir -p /var/log/postgresql/data/
chown postgres /var/lib/postgresql/data/ /var/log/postgresql/


# FIXME: wal archive ?
su - postgres  -c '/usr/local/bin/initdb -D /var/lib/postgresql/data/ -k'

echo >> /var/lib/postgresql/data/pg_hba.conf "host all all  0.0.0.0/0 trust"
echo >> /var/lib/postgresql/data/pg_hba.conf "host replication all  0.0.0.0/0 trust"

su - postgres -c '/usr/local/bin/pg_ctl -D /var/lib/postgresql/data start'
psql -h localhost -U postgres postgres -c 'create user repl with superuser'
psql -h localhost -U postgres postgres -c 'create user root with superuser'
psql -h localhost -U postgres postgres -c 'create database mydb'
psql -h localhost -U postgres postgres -c 'create database root'

pgbench -h localhost -U postgres -d mydb -i
#pgbench -h localhost -U postgres -d mydb -P1 -j 10 -t 1000
#select pg_current_wal_lsn(); \watch 1
#select pg_current_wal_lsn(), pg_current_wal_insert_lsn();
