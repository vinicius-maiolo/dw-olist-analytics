CREATE TABLE `olist-analytics.curated_olist.products` AS
SELECT 
  CAST(product_id AS STRING) AS product_id,
  CAST(product_category_name AS STRING) product_category_name,
  CAST(product_name_lenght AS INT64) product_name_lenght,
  CAST(product_description_lenght AS INT64) product_description_lenght,
  CAST(product_photos_qty AS INT64) product_photos_qty,
  CAST(product_weight_g AS FLOAT64) product_weight_g,
  CAST(product_length_cm AS FLOAT64) AS product_length_cm,
  CAST(product_height_cm AS FLOAT64) AS product_height_cm,
  CAST(product_width_cm AS FLOAT64) AS product_width_cm
FROM `olist-analytics.raw_olist.products`