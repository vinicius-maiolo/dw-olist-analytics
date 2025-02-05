CREATE OR REPLACE TABLE `olist-analytics.dw_olist.dts_performance_pedidos` AS
  SELECT 
  concat(id_pedido, id_item_pedido, metodo_pagamento) as chv_pedido_item_metodo
  , dp.id_produto -- idealmente, estaria  campo "nome_produto", porém não temos essa informação no banco
  , dp.categoria
  , dc.id_cliente -- id_geral do cliente dentro do banco
  , dc.id_cliente_pedido -- id específico do cliente neste pedido (o mesmo cliente pode ter mudado o endereço, por exemplo)
  , dc.municipio_cliente as municipio_entrega -- no momento da entrega
  , dc.uf_cliente as uf_entrega
  , ds.id_seller -- idem "nome_seller"
  , ds.municipio_seller
  , ds.uf_seller
  , ft.status_pedido
  , ft.timestamp_compra
  , ft.timestamp_aprovacao
  , ft.timestamp_despacho
  , ft.timestamp_entrega
  , ft.data_prometida_entrega
  , ft.valor_mercadoria
  , ft.valor_frete
  , ft.valor_produto
  , ft.qtde_parcelas
  , ft.metodo_pagamento
  , ft.valor_pedido_pago 
    
  FROM `olist-analytics.dw_olist.ft_pedido_aprovado` ft
  
  LEFT JOIN `dw_olist.dim_produto` dp
    ON ft.id_produto = dp.id_produto
  
  LEFT JOIN `dw_olist.dim_seller` ds
    ON ds.id_seller = ft.id_seller
  
  LEFT JOIN `dw_olist.dim_cliente` dc
    ON dc.id_cliente_pedido = ft.id_cliente_pedido