#!/bin/bash

echo "Enter Date to query(Format 2013-03-13):"
read date
mysql -hw2-enm-db-s2 -uroot -p tssenm -e "select cp_use_log_tbl.create_dt AS date,SUM(cp_use_log_tbl.use_coin) AS total FROM user_tbl LEFT JOIN cp_use_log_tbl ON user_tbl.owner_id = cp_use_log_tbl.owner_id WHERE payment_log_id IS NOT NULL AND cp_use_log_tbl.create_dt LIKE '$date%'"
