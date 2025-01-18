#!/bin/bash
pgbench -h localhost -U postgres -d mydb -P1 -j 10 -t 10000000
