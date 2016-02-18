!/bin/bash

# variables (should come from terraform)
#user='gforge'
#pass='gforge'
#db='gforge'

# export variables
#sudo -i # switch to root
cd ~
sudo echo "export PSQLUSER=\"gforge\"" >> ~/.bashrc
sudo echo "export PSQLPASS=\"gforge\"" >> ~/.bashrc
sudo echo "export DB=\"gforge\"" >> ~/.bashrc
source ~/.bashrc

#echo "USER SET: $PSQLUSER"
#echo "PASSWORD SET: $PASS"
#echo "DB SET: $DB"

#sudo echo user_allow_other >> fuse.conf
#sudo mv fuse.conf /etc/fuse.conf
#sudo chmod 644 /etc/fuse.conf
sudo yum -y install postgresql94.x86_64 postgresql94-server.x86_64 postgresql94-contrib.x86_64 git
sudo service postgresql94 initdb
sudo chkconfig postgresql94 on
sudo su -c "sudo sed -i -e 's/peer/trust/g' ~postgres/data/pg_hba.conf"
sudo su -c "sudo sed -i -e 's/ident/trust/g' ~postgres/data/pg_hba.conf"


# Add only authorized hosts i.e DOME, Rest Services preferably via  config file
sudo su -c "echo \"host all gforge 172.0.0.0/8 trust\" >> ~postgres/data/pg_hba.conf"
sudo su -c "echo \"listen_addresses = '*'\" >> ~postgres/data/postgresql.conf"
sudo service postgresql94 start
#sleep 30

psql -U postgres -c "CREATE ROLE gforge NOSUPERUSER NOCREATEDB NOCREATEROLE INHERIT LOGIN PASSWORD 'gforge';"

