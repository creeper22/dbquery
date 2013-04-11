#!/bin/bash

mysql -hw1-enm-db-s2 -uroot -p tssenm -e "select user_tbl.user_name,SUM(cp_use_log_tbl.use_coin) FROM user_tbl LEFT JOIN cp_use_log_tbl ON user_tbl.owner_id = cp_use_log_tbl.owner_id WHERE payment_log_id IS NOT NULL AND cp_use_log_tbl.create_dt LIKE '2013-04%' GROUP BY cp_use_log_tbl.owner_id ORDER BY user_name"
