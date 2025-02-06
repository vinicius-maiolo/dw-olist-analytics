CREATE TABLE `curated_olist.order_items` AS
SELECT
  CAST(order_id AS STRING) AS order_id,
  CAST(order_item_id AS STRING) AS order_item_id,
  CAST(product_id AS STRING) AS product_id,
  CAST(seller_id AS STRING) AS seller_id,
  CAST(shipping_limit_date AS TIMESTAMP) AS shipping_limit_date,
  CAST(price AS FLOAT64) AS price,
  CAST(freight_value AS FLOAT64) AS freight_value
FROM
  `raw_olist.order_items`;