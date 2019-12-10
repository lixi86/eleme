#!/bin/bash

########################### user_addr ################################
hdfs dfs -rmr /user/root/user_addr
sqoop import \
--connect jdbc:mysql://192.168.49.101:3306/szbap_ods \
--username root \
--password 123456 \
--table user_addr \
--hive-table szbbp_dim.dim_user_addr \
--hive-overwrite \
--hive-import \
-m 1

########################### user ################################
hdfs dfs -rmr /user/root/dim_user
sqoop import \
--connect jdbc:mysql://192.168.49.101:3306/szbap_ods \
--username root \
--password 123456 \
--table user \
--hive-table szbbp_dim.dim_user \
--hive-overwrite \
--hive-import \
-m 1

########################### user_extend ################################
hdfs dfs -rmr /user/root/dim_user_extend
sqoop import \
--connect jdbc:mysql://192.168.49.101:3306/szbap_ods \
--username root \
--password 123456 \
--table user_extend \
--hive-table szbbp_dim.dim_user_extend \
--hive-overwrite \
--hive-import \
-m 1