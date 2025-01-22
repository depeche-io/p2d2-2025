

-- primary
CHECKPOINT;
su - postgres -c '/usr/local/bin/pg_ctl -D /var/lib/postgresql/data/ stop -m fast'


-- NO LEADER AT THIS POINT

-- replica

select pg_create_physical_replication_slot('red');
select pg_promote();


-- primary


touch /var/lib/postgresql/data/standby.signal
echo >>/var/lib/postgresql/data/postgresql.auto.conf "primary_conninfo = 'user=root passfile=''/root/.pgpass'' channel_binding=prefer host=''pg-blue'' port=5432 sslmode=prefer sslnegotiation=postgres sslcompression=0 sslcertmode=allow sslsni=1 ssl_min_protocol_version=TLSv1.2 gssencmode=prefer krbsrvname=postgres gssdelegation=0 target_session_attrs=any load_balance_hosts=disable'"
echo >>/var/lib/postgresql/data/postgresql.auto.conf "primary_slot_name = 'red'"

select * from pg_stat_wal_receiver;

