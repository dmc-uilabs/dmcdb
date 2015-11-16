#!/bin/bash

echo user_allow_other >> fuse.conf
mv fuse.conf /etc/fuse.conf
chmod 644 /etc/fuse.conf
yum -y install postgresql91 postgresql91-server postgresql91-contrib
service postgresql-9.1 initdb
chkconfig postgresql-9.1 on
echo "local all all trust" >> ~postgres/9.1/data/pg_hba.conf

# Add only authorized hosts i.e DOME, Rest Services preferably via  config file
echo host all gforge 172.0.0.0/8 trust >> ~postgres/9.1/data/pg_hba.conf
echo "listen_addresses = '*'" >> ~postgres/9.1/data/postgresql.conf
service postgresql-9.1 start
sleep 60

# create users, prefereably via the same config file above
psql -c 'CREATE ROLE gforge NOSUPERUSER NOCREATEDB NOCREATEROLE INHERIT LOGIN;' template1
psql -c 'CREATE DATABASE gforge WITH OWNER gforge;' template1
psql -c 'reateuser -h localhost –p 5432 -S -d -R -l gforge;' template1
psql -c 'createdb -h localhost –p 5432 gforge;' template1
psql -d gforge < db_dump_11.16.15.sql

