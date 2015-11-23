#!/bin/bash

# variables (should come from terraform)
#user='gforge'
#pass='gforge'
#db='gforge'

# export variables
sudo -i # switch to root
cd ~
echo "export PSQLUSER=$psqluser" >> ~/.bashrc
echo "export PASS=$pass" >> ~/.bashrc
echo "export DB=$db" >> ~/.bashrc
source ~/.bashrc

echo "USER SET: $PSQLUSER"
echo "PASSWORD SET: $PASS"
echo "DB SET: $DB"

echo user_allow_other >> fuse.conf
mv fuse.conf /etc/fuse.conf
chmod 644 /etc/fuse.conf
yum -y install postgresql94.x86_64 postgresql94-server.x86_64 postgresql94-contrib.x86_64
service postgresql94 initdb
chkconfig postgresql94 on
echo "local all all trust" >> ~postgres/9.1/data/pg_hba.conf

# Add only authorized hosts i.e DOME, Rest Services preferably via  config file
echo "host all gforge 172.0.0.0/8 trust" >> ~postgres/data/pg_hba.conf
echo "listen_addresses = '*'" >> ~postgres/data/postgresql.conf
service postgresql94 start
sleep 30

# create users, prefereably via the same config file above
su postgres
cd ~postgres
git clone https://bitbucket.org/DigitalMfgCommons/dmcdb.git
cd dmcdb
# git pull from master DB to get latest version of gforge.psql
#mv gforge.psql /var/lib/pgsql/.
[ -z "$PASS" ]

if env | grep -q ^PASS=
then
  psql -c "CREATE ROLE $user NOSUPERUSER NOCREATEDB NOCREATEROLE INHERIT LOGIN PASSWORD $pass;" template1
else
  psql -c "CREATE ROLE $user NOSUPERUSER NOCREATEDB NOCREATEROLE;" template1
fi
psql -c "CREATE DATABASE $db WITH OWNER gforge;" template1
#psql -c 'createuser -h localhost –p 5432 -S -d -R -l gforge;' template1
#psql -c 'createdb -h localhost –p 5432 gforge;' template1
psql -d gforge < gforge.psql

