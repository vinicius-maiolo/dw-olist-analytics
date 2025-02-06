CREATE TABLE `olist-analytics.curated_olist.orders` AS
SELECT 
  CAST(order_id AS STRING) AS order_id,
  CAST(customer_id AS STRING) customer_id,
  CAST(order_status AS STRING) AS order_status,
  TIMESTAMP(order_purchase_timestamp) AS order_purchase_timestamp,
  TIMESTAMP(order_approved_at) AS order_approved_at,
  TIMESTAMP(order_delivered_carrier_date) AS order_delivered_carrier_date,
  TIMESTAMP(order_delivered_customer_date) AS order_delivered_customer_date,
  DATE(TIMESTAMP(order_estimated_delivery_date)) AS order_estimated_delivery_date
FROM `olist-analytics.raw_olist.orders`