-- FATO PEDIDO APROVADO

CREATE OR REPLACE TABLE `olist-analytics.dw_olist.ft_pedido_aprovado` AS

WITH metodos_pagamento_pedido as (
  /*
  CTE desenvolvida para lidar com o cenário de múltiplas formas de pagamento para um
  mesmo pedido. A tabela fato possui granularidade item | método de pagamento,
  de forma que, para pedidos com n itens e m formas de pagamento, espera-se o retorno de
  m*n registros.
  
  Nesse sentido, as colunas valor_mercadoria, valor_frete e valor_produto apresentam o
  valor pago pelo respectivo método de pagamento para o item do registro
  (1(+) linha(s)/item em caso de split de pagamento). 
  
  O campo valor_pedido_pago apresenta, em cada registro, o valor TOTAL pago pelo método
  de pagamento no pedido. */
 
  SELECT 
    op.order_id as id_pedido
    , op.payment_type as metodo_pagamento
    , SUM(op.payment_value) as valor_pago_metodo
    , SAFE_DIVIDE(SUM(op.payment_value), SUM(SUM(op.payment_value)) OVER (PARTITION BY op.order_id)) AS pct_metodo_pgto

  FROM `curated_olist.order_payments` op
  
  GROUP BY 1,2
)

--select * from metodos_pagamento_pedido where id_pedido = '1d251ab94983c4adb11e4b168abb1439'

SELECT 
  o.order_id as id_pedido
  , oi.order_item_id as id_item_pedido
  , oi.product_id as id_produto
  , oi.seller_id as id_seller
  , c.customer_unique_id as id_cliente
  , c.customer_id as id_cliente_pedido 
  , o.order_status as status_pedido
  , o.order_purchase_timestamp as timestamp_compra
  , o.order_approved_at as timestamp_aprovacao
  , o.order_delivered_carrier_date as timestamp_despacho
  , o.order_delivered_customer_date as timestamp_entrega
  , o.order_estimated_delivery_date as data_prometida_entrega
  , ROUND(oi.price*mpp.pct_metodo_pgto,2) as valor_mercadoria
  , ROUND(oi.freight_value*pct_metodo_pgto,2) as valor_frete
  , ROUND(oi.price*mpp.pct_metodo_pgto + oi.freight_value*pct_metodo_pgto, 2) AS valor_produto
  , op.payment_type as metodo_pagamento
  , ROUND(SUM(op.payment_value), 2) as valor_pedido_pago
  , max(op.payment_installments) as qtde_parcelas -- para pedidos com split de pagamento na mesma modalidade, o numero de parcelas é o número da maior quantiade de parcela na modalidade

  
FROM `curated_olist.order_items` oi
LEFT JOIN `curated_olist.orders` o
  ON o.order_id = oi.order_id
LEFT JOIN `curated_olist.order_payments` op
  ON o.order_id = op.order_id
LEFT JOIN `curated_olist.customers` c
  ON o.customer_id = c.customer_id
LEFT JOIN metodos_pagamento_pedido mpp
  ON mpp.id_pedido = op.order_id
  AND mpp.metodo_pagamento = op.payment_type

GROUP BY 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16