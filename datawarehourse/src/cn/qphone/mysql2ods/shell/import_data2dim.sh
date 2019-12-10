#!/bin/bash

##########################################################################
###########################导入维度数据####################################
##########################################################################

########################### code_category ################################

hdfs dfs -rmr /user/root/code_category
sqoop import \
--connect jdbc:mysql://192.168.49.101:3306/szbap_ods \
--username root \
--password 123456 \
--table code_category \
--hive-table szbbp_dim.dim_code_category \
--hive-overwrite \
--hive-import \
-m 1

########################### code_city #################################

hdfs dfs -rmr /user/root/code_city
sqoop import \
--connect jdbc:mysql://192.168.49.101:3306/szbap_ods \
--username root \
--password 123456 \
--table code_city \
--hive-table szbbp_dim.dim_code_city \
--hive-overwrite \
--hive-import \
-m 1

########################### code_education ################################
hdfs dfs -rmr /user/root/code_education
sqoop import \
--connect jdbc:mysql://192.168.49.101:3306/szbap_ods \
--username root \
--password 123456 \
--table code_education \
--hive-table szbbp_dim.dim_code_education \
--hive-overwrite \
--hive-import \
-m 1

########################### code_email_suffix ################################
hdfs dfs -rmr /user/root/code_email_suffix
sqoop import \
--connect jdbc:mysql://192.168.49.101:3306/szbap_ods \
--username root \
--password 123456 \
--table code_email_suffix \
--hive-table szbbp_dim.dim_code_email_suffix \
--hive-overwrite \
--hive-import \
-m 1

########################### code_goods ################################
hdfs dfs -rmr /user/root/code_goods
sqoop import \
--connect jdbc:mysql://192.168.49.101:3306/szbap_ods \
--username root \
--password 123456 \
--table code_goods \
--hive-table szbbp_dim.dim_code_goods \
--hive-overwrite \
--hive-import \
-m 1

########################### code_profession ################################
hdfs dfs -rmr /user/root/code_profession
sqoop import \
--connect jdbc:mysql://192.168.49.101:3306/szbap_ods \
--username root \
--password 123456 \
--table code_profession \
--hive-table szbbp_dim.dim_code_profession \
--hive-overwrite \
--hive-import \
-m 1

########################### code_shop ################################
hdfs dfs -rmr /user/root/code_shop
sqoop import \
--connect jdbc:mysql://192.168.49.101:3306/szbap_ods \
--username root \
--password 123456 \
--table code_shop \
--hive-table szbbp_dim.dim_code_shop \
--hive-overwrite \
--hive-import \
-m 1