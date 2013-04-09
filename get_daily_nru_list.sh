#!/bin/bash

echo "Enter Date to query(Format 2013-03-13):"
read date
mysql -hw1-enm-db-s2 -uroot -p tssenm -e "SELECT user_name,ip FROM user_tbl WHERE create_dt LIKE '$date%' INTO OUTFILE '/tmp/user_ip.csv' FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n';"
scp w1-enm-db-s2:/tmp/user_ip.csv /root/user_ip_$date.csv
