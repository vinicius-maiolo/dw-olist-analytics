CREATE OR REPLACE TABLE `olist-analytics.dw_olist.dim_cliente` AS

SELECT 
  c.customer_unique_id as id_cliente
  , c.customer_id as id_cliente_pedido
  , c.customer_zip_code_prefix as cep_prefixo
  , c.customer_city as municipio_cliente
  , c.customer_state as uf_cliente

FROM `olist-analytics.curated_olist.customers` c