
 alter system set max_standby_streaming_delay ='100ms';

 select pg_reload_conf();

begin; select * from pgbench_accounts   order by random(), random(), random();

2025-01-19 08:49:03.387 UTC [61] ERROR:  canceling statement due to conflict with recovery
2025-01-19 08:49:03.387 UTC [61] DETAIL:  User query might have needed to see row versions that must be removed.
2025-01-19 08:49:03.387 UTC [61] STATEMENT:  select * from pgbench_accounts   order by random(), random(), random();
ERROR:  canceling statement due to conflict with recovery
DETAIL:  User query might have needed to see row versions that must be removed.

