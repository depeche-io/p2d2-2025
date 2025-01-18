#!/bin/bash

echo "select pg_create_physical_replication_slot('green');"
echo "SELECT pg_backup_start(label => 'green', fast => true);"
echo "SELECT * FROM pg_backup_stop(wait_for_archive => false);"

echo "psql -h pg-red"

echo -----
echo touch /root/.pgpass
echo cp -rf /mnt/red-datadir/* /var/lib/postgresql/data
echo chown -R postgres /var/lib/postgresql/data
echo touch /var/lib/postgresql/data/standby.signal
echo "echo >>/var/lib/postgresql/data/postgresql.auto.conf \"primary_conninfo = 'user=root passfile=''/root/.pgpass'' channel_binding=prefer host=''pg-red'' port=5432 sslmode=prefer sslnegotiation=postgres sslcompression=0 sslcertmode=allow sslsni=1 ssl_min_protocol_version=TLSv1.2 gssencmode=prefer krbsrvname=postgres gssdelegation=0 target_session_attrs=any load_balance_hosts=disable'\""
echo "echo >>/var/lib/postgresql/data/postgresql.auto.conf \"primary_slot_name = 'green'\""

