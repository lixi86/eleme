CREATE TABLE `szbbp_dim`.`dim_user_addr` (
  `user_id` bigint,
  `order_addr` string,
  `user_order_flag` int,
  `addr_id` bigint,
  `arear_id` int
)
;

CREATE TABLE `szbbp_dim`.`dim_user` (
  `user_id` bigint,
  `user_name` string,
  `user_gender` int,
  `user_birthday` timestamp,
  `user_age` int,
  `constellation` string,
  `province` string,
  `city` string,
  `city_level` int,
  `e_mail` string,
  `op_mail` string,
  `mobile` bigint,
  `num_seg_mobile` int,
  `op_Mobile` string,
  `register_time` timestamp,
  `login_ip` string,
  `login_source` string,
  `request_user` string,
  `total_score` decimal(18,2),
  `used_score` decimal(18,2),
  `is_blacklist` int,
  `is_married` int,
  `education` string,
  `monthly_income` decimal(18,2),
  `profession` string,
  `create_date` timestamp
)
;

CREATE TABLE `szbbp_dim`.`dim_user_extend` (
  `user_id` bigint,
  `user_gender` bigint,
  `is_pregnant_woman` int,
  `is_have_children` int,
  `is_have_car` int,
  `phone_brand` string,
  `phone_brand_level` string,
  `phone_cnt` int,
  `change_phone_cnt` int,
  `is_maja` int,
  `majia_account_cnt` int,
  `loyal_model` string,
  `shopping_type_model` string,
  `weight` int,
  `height` int
)
;