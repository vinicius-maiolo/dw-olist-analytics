CREATE TABLE `olist-analytics.dw_olist.dim_produto` AS

SELECT 
  product_id as id_produto
  , product_category_name as categoria 
  , product_weight_g as peso_g
  , product_length_cm as comprimento_cm
  , product_height_cm as peso_cm
  , product_width_cm as largura_cm 

FROM `olist-analytics.curated_olist.products`