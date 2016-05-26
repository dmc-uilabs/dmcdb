dropdb -U postgres gforge 
psql -U postgres -c "CREATE DATABASE gforge WITH OWNER gforge;"
psql -U postgres -d gforge < gforge.psql
psql -U postgres -d gforge < insert_sample_data.psql
psql -U postgres -d gforge < insert_servicerun_sample_data.psql