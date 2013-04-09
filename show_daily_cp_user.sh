#!/bin/bash

echo "Enter Date to query(Format 2013-03-13):"
read date
mysql -hw1-enm-db-s2 -uroot -p tssenm -e "select user_tbl.user_name AS user_name,SUM(cp_use_log_tbl.use_coin) AS cp_purchased FROM user_tbl LEFT JOIN cp_use_log_tbl ON user_tbl.owner_id = cp_use_log_tbl.owner_id WHERE payment_log_id IS NOT NULL AND cp_use_log_tbl.create_dt LIKE '$date%' GROUP BY cp_use_log_tbl.owner_id ORDER BY use_coin"
