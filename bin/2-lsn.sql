
#select pg_current_wal_lsn(), pg_current_wal_insert_lsn();

SELECT * FROM pg_control_checkpoint();

SELECT pg_current_wal_lsn() - '0/0';



select '0/C6F54810'::pg_lsn - '0/BCD270D0'::pg_lsn;

root=# SELECT system_identifier FROM pg_control_system();
  system_identifier  
---------------------
 7460748325696958516
(1 row)

