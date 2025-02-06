CREATE TABLE `olist-analytics.curated_olist.geolocation` AS
SELECT 
  CAST(geolocation_zip_code_prefix AS STRING) AS geolocation_zip_code_prefix,
  CAST(geolocation_lat AS NUMERIC) AS geolocation_lat,
  CAST(geolocation_lng AS NUMERIC) AS geolocation_lng,
  CAST(geolocation_city AS STRING) AS geolocation_city,
  CAST(geolocation_state AS STRING) AS geolocation_state
FROM `olist-analytics.raw_olist.geolocation` 