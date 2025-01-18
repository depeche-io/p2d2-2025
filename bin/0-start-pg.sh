#!/bin/bash

su - postgres -c '/usr/local/bin/pg_ctl -D /var/lib/postgresql/data start'
