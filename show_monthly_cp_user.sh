#!/bin/bash
mv /root/month_cp.csv /root/month_cp.old
ssh w1-enm-db-s2 'rm -f /tmp/month_cp.csv'
mysql -hw1-enm-db-s2 -utssenm_slv -p tssenm -e "select user_tbl.user_name,SUM(cp_use_log_tbl.use_coin) FROM user_tbl LEFT JOIN cp_use_log_tbl ON user_tbl.owner_id = cp_use_log_tbl.owner_id WHERE payment_log_id IS NOT NULL AND cp_use_log_tbl.create_dt LIKE '2013-06%' GROUP BY cp_use_log_tbl.owner_id ORDER BY user_name INTO OUTFILE '/tmp/month_cp.csv' FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n';"
scp w1-enm-db-s2:/tmp/month_cp.csv /root/month_cp.csv
