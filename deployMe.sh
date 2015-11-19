#!/bin/bash

# export variables
export USER="gforge"
export PASS="gfore"
export DB="gforge"

echo user_allow_other >> fuse.conf
mv fuse.conf /etc/fuse.conf
chmod 644 /etc/fuse.conf
yum -y install postgresql postgresql-server postgresql-contrib
service postgresql initdb
chkconfig postgresql on
echo "local all all trust" >> ~postgres/data/pg_hba.conf

# Add only authorized hosts i.e DOME, Rest Services preferably via  config file
echo host all gforge 172.0.0.0/8 trust >> ~postgres/data/pg_hba.conf
echo "listen_addresses = '*'" >> ~postgres/data/postgresql.conf
service postgresql start
sleep 30

# create users, prefereably via the same config file above
su - postgres

# git pull from master DB to get latest version of gforge.psql
mv gforge.psql /var/lib/pgsql/.
psql -c "CREATE ROLE gforge NOSUPERUSER NOCREATEDB NOCREATEROLE INHERIT LOGIN PASSWORD 'test';" template1
psql -c 'CREATE DATABASE gforge WITH OWNER gforge;' template1
#psql -c 'createuser -h localhost –p 5432 -S -d -R -l gforge;' template1
#psql -c 'createdb -h localhost –p 5432 gforge;' template1
psql -d gforge < gforge.psql

