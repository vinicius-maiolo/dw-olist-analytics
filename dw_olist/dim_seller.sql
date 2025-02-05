CREATE OR REPLACE TABLE `olist-analytics.dw_olist.dim_seller` AS

SELECT 
  seller_id as id_seller
  , seller_zip_code_prefix as cep_prefixo_seller
  , seller_city as municipio_seller
  , seller_state as uf_seller

FROM `olist-analytics.curated_olist.sellers` c