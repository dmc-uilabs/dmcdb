#!/bin/bash

# variables (should come from terraform)
#user='gforge'
#pass='gforge'
#db='gforge'

# export variables
#sudo -i # switch to root
cd ~
sudo echo "export PSQLUSER=$psqluser" >> ~/.bashrc
sudo echo "export PASS=$pass" >> ~/.bashrc
sudo echo "export DB=$db" >> ~/.bashrc
source ~/.bashrc

#echo "USER SET: $PSQLUSER"
#echo "PASSWORD SET: $PASS"
#echo "DB SET: $DB"

sudo echo user_allow_other >> fuse.conf
sudo mv fuse.conf /etc/fuse.conf
sudo chmod 644 /etc/fuse.conf
sudo yum -y install postgresql94.x86_64 postgresql94-server.x86_64 postgresql94-cont$
sudo service postgresql94 initdb
sudo chkconfig postgresql94 on
sudo su -c 'echo "local all all trust" >> ~postgres/data/pg_hba.conf'

# Add only authorized hosts i.e DOME, Rest Services preferably via  config file
sudo su -c 'echo "host all gforge 172.0.0.0/8 trust" >> ~postgres/data/pg_hba.conf'
sudo su -c 'echo "listen_addresses = '*'" >> ~postgres/data/postgresql.conf'

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

