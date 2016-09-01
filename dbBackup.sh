#!/bin/bash -v

echo "creating the db dump"



  	pg_dump -U postgres -h localhost gforge > /home/ec2-user/archivesgforge.sql
    touch db.log
    echo "Ran backup and archive of gforge to $s3_bucket/$(date +"%Y-%m-%d-%H-%M")" >> db.log
    echo "moving the dump to the s3 bucket"

    aws s3  mv /home/ec2-user/archivesgforge.sql s3://$s3_bucket/$(date +"%Y-%m-%d-%H-%M")/archivesgforge.sql
    aws s3  cp /home/ec2-user/db.log s3://$s3_bucket/db.log
