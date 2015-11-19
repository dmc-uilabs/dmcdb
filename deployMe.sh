#!/bin/bash

# variables (should come from terraform)
user='gforge'
pass='gforge'
db='gforge'

# export variables
echo "export USER=$user" >> ~/.bashrc
echo "export PASS=$pass" >> ~/.bashrc
echo "export DB=$db" >> ~/.bashrc
source ~/.bashrc

echo "USER SET: $USER"
echo "PASSWORD SET: $pass"
echo "DB SET: $db"

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
sleep 30

# create users, prefereably via the same config file above
su - postgres

# git pull from master DB to get latest version of gforge.psql
mv gforge.psql /var/lib/pgsql/.
psql -c "CREATE ROLE $user NOSUPERUSER NOCREATEDB NOCREATEROLE INHERIT LOGIN PASSWORD $pass;" template1
psql -c "CREATE DATABASE $db WITH OWNER gforge;" template1
#psql -c 'createuser -h localhost –p 5432 -S -d -R -l gforge;' template1
#psql -c 'createdb -h localhost –p 5432 gforge;' template1
psql -d gforge < gforge.psql

