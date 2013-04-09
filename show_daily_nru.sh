#!/bin/bash

echo "Enter Date to query(Format 2013-03-13):"
read date
mysql -hw1-enm-db-s2 -uroot -p tssenm -e "select count(user_name)AS daily_nru FROM user_tbl WHERE create_dt LIKE '$date%'"
