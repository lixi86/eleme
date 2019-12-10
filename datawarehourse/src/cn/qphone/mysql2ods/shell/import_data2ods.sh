#!/bin/bash

##########################################################################
###########################导入ods层数据临时表历史数据####################################
##########################################################################

########################### us_order ################################
hdfs dfs -rmr /user/root/us_order
sqoop import \
--connect jdbc:mysql://192.168.49.101:3306/szbap_ods \
--username root \
--password 123456 \
--table us_order \
--target-dir /home/apps/hive-1.1.0-cdh5.7.6/warehouse/szbbp_ods_tmp.db/us_order_tmp \
--fields-terminated-by '\001' \
--check-column order_date \
--incremental lastmodified \
--last-value 0 \
-m 1 \
--append

hive -e "
from szbbp_ods_tmp.us_order_tmp
insert overwrite table szbbp_ods.ods_us_order partition(dt)
select *, date(order_date) dt
"
############################## bbp_ods.ods_order_item(*) ####################################
hdfs dfs -rmr /user/root/order_item
sqoop import \
--connect jdbc:mysql://192.168.49.101:3306/szbap_ods \
--username root \
--password 123456 \
--table order_item \
--target-dir /home/apps/hive-1.1.0-cdh5.7.6/warehouse/szbbp_ods_tmp.db/order_item_tmp \
--fields-terminated-by '\001' \
--check-column update_time \
--incremental lastmodified \
--last-value 0 \
-m 1 \
--append

hive -e "
from szbbp_ods_tmp.order_item_tmp
insert overwrite table szbbp_ods.ods_order_item partition(dt)
select *, date(update_time) as dt
"

########################## szbbp_ods_.ods_order_delivery(*) ###########################
hdfs dfs -rmr /user/root/order_delivery
sqoop import --connect jdbc:mysql://192.168.49.101:3306/szbap_ods \
--username root \
--password 123456 \
--table order_delivery \
--target-dir /home/apps/hive-1.1.0-cdh5.7.6/warehouse/szbbp_ods_tmp.db/order_delivery_tmp \
--fields-terminated-by '\001' \
--check-column update_time \
--incremental lastmodified \
--last-value 0 \
-m 1 \
--append

hive -e "
from szbbp_ods_tmp.order_delivery_tmp
insert overwrite table szbbp_ods.ods_order_delivery partition(dt)
select *, date(update_time) as dt
"

############################## szbbp_ods_.ods_biz_trade(*) ####################################
hdfs dfs -rmr /user/root/ods_biz_trade
sqoop import --connect jdbc:mysql://192.168.49.101:3306/szbap_ods \
--username root \
--password 123456 \
--table biz_trade \
--target-dir /home/apps/hive-1.1.0-cdh5.7.6/warehouse/szbbp_ods_tmp.db/biz_trade_tmp \
--fields-terminated-by '\001' \
--check-column trade_time \
--incremental lastmodified \
--last-value 0 \
-m 1 \
--append

hive -e "
from szbbp_ods_tmp.biz_trade_tmp
insert overwrite table szbbp_ods.ods_biz_trade partition(dt)
select *, date(trade_time) as dt
"

############################## szbbp_ods_.ods_cart(*) ####################################
hdfs dfs -rmr /user/root/cart
sqoop import --connect jdbc:mysql://192.168.49.101:3306/szbap_ods \
--username root \
--password 123456 \
--table cart \
--target-dir /home/apps/hive-1.1.0-cdh5.7.6/warehouse/szbbp_ods_tmp.db/cart_tmp \
--fields-terminated-by '\001' \
--check-column sumbit_time \
--incremental lastmodified \
--last-value 0 \
-m 1 \
--append

hive -e "
from szbbp_ods_tmp.cart_tmp
insert overwrite table szbbp_ods.ods_cart partition(dt)
select *, date(sumbit_time) as dt
"