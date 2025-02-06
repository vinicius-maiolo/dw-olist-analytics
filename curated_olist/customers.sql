CREATE TABLE curated_olist.customers AS
SELECT
  CAST(customer_id AS STRING) AS customer_id,
  CAST(customer_unique_id AS STRING) AS customer_unique_id,
  CAST(customer_zip_code_prefix AS INT64) AS customer_zip_code_prefix,
  CAST(customer_city AS STRING) AS customer_city,
  CAST(customer_state AS STRING) AS customer_state
FROM
  `raw_olist.customers`;