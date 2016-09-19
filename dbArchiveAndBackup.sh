#!/bin/bash
pg_dump -U postgres -h localhost gforge

if [ $? -ne 0 ]; 
then 
	echo "Your database at $ip is corrupted on $date. Trying to recover from last dump." | sendmail $email
	cd /home/ec2-user/dmcdb
	git pull origin master
	dropdb -h localhost -p 5432 -U postgres --if-exists gforge
 	createdb -h localhost -p 5432 -U postgres -O gforge gforge
	psql -h localhost -p 5432 -d gforge -U postgres < gforge.psql
	if [ $? -ne 0 ]; 
	then 
		echo "Attempted recovery failed for database at $ip on $date. Please perform manual recovery." | sendmail $email
	else
		echo "Recovery successful on database at $ip on $date." | sendmail $email
	fi
else 
	pg_dump -U postgres -h localhost gforge > /home/ec2-user/dmcdb/gforge.psql
	cp /home/ec2-user/dmcdb/gforge.psql archivesgforge$(date +%F_%R).sql
	touch db.log
	echo "Ran backup and archive of gforge on $(date)" >> db.log

	cd /home/ec2-user/dmcdb
	git add .
	git commit -m "adding revised gforge dump and archive on $(date)"
	git push origin master

	
fi
