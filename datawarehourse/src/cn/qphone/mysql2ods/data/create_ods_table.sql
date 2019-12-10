drop database if exists szbbp_ods CASCADE;
-- hive 建库
create database if not exists szbbp_ods;
create database if not exists szbbp_dwd;
create database if not exists szbbp_dws;
create database if not exists szbbp_dm;

use szbbp_ods;

--------------------------------------------------------------------------
------------------------  导入临时增量数据 ------------------------------------
--------------------------------------------------------------------------
--------------------------- ods_us_order --------------------------------
CREATE TABLE IF NOT EXISTS `szbbp_ods`.`ods_us_order` (
  `order_id` bigint,
  `order_no` string,
  `order_date` timestamp,
  `user_id` bigint,
  `user_name` string,
  `order_money` decimal(18,2),
  `order_type` int,
  `order_status` int,
  `pay_status` int,
  `pay_type` int,
  `order_source` string,
  `update_time` timestamp
)
 PARTITIONED BY (dt string)
;

--------------------------- ods_biz_trade --------------------------------
CREATE TABLE szbbp_ods.ods_biz_trade (
  trade_id bigint,
  order_id bigint,
  user_id bigint,
  amount decimal(18,2),
  trade_type int,
  trade_time timestamp
)
partitioned by (dt string)
;

--------------------------- ods_cart --------------------------------
CREATE TABLE szbbp_ods.ods_cart (
  cart_id bigint,
  session_id string,
  user_id bigint,
  goods_id bigint,
  goods_num int,
  add_time string,
  cancle_time string,
  sumbit_time timestamp,
  create_date string
)
partitioned by (dt string)
;



--------------------------- ods_order_delivery --------------------------------
CREATE TABLE szbbp_ods.ods_order_delivery (
  order_id bigint,
  order_no string,
  consignee string,
  area_id bigint,
  area_name string,
  address string,
  mobile bigint,
  phone string,
  coupon_id bigint,
  coupon_money decimal(18,2),
  carriage_money decimal(18,2),
  create_time string,
  update_time timestamp,
  addr_id bigint
)
partitioned by (dt string)
;

--------------------------- ods_order_item --------------------------------
CREATE TABLE szbbp_ods.ods_order_item (
  user_id bigint,
  order_id bigint,
  order_no string,
  goods_id bigint,
  goods_no string,
  goods_name string,
  goods_amount int,
  shop_id bigint,
  shop_name string,
  curr_price decimal(18,2),
  market_price decimal(18,2),
  discount decimal(18,2),
  cost_price decimal(18,2),
  first_cart bigint,
  first_cart_name string,
  second_cart bigint,
  second_cart_name string,
  third_cart bigint,
  third_cart_name string,
  goods_desc string,
  update_time timestamp
)
partitioned by (dt string)
;

--------------------------- ods_user_app_click_log --------------------------------
CREATE TABLE szbbp_ods.ods_user_app_click_log (
  log_id bigint,
  user_id bigint,
  imei string,
  log_time string,
  visit_os string,
  os_version string,
  app_name string,
  app_version string,
  device_token string,
  visit_ip string,
  province string,
  city string
)
partitioned by (dt string)
;

--------------------------- ods_user_pc_click_log --------------------------------
CREATE TABLE szbbp_ods.ods_user_pc_click_log (
  log_id bigint,
  user_id bigint,
  session_id string,
  cookie_id string,
  visit_time string,
  visit_url string,
  visit_os string,
  browser_name string,
  visit_ip string,
  province string,
  city string,
  page_id int,
  goods_id bigint,
  shop_id bigint
)
partitioned by (dt string)
;