-- FATO PEDIDO AVALIADO

/*NOTA: Embora um mesmo pedido possa ter produtos diferentes, as avaliações (reviews) são dadas a nível de pedido. Assim, não é
possível cruzar, diretamente e de forma segura, os dados de avaliações e dados de produtos, podendo-se incorrer no erro de atribuir incorretamente avaliações a produtos do mesmo pedido.*/

CREATE TABLE `olist-analytics.dw_olist.ft_pedido_avaliado` AS 
SELECT 
  orvw.review_id as id_avaliacao 
  , orvw.order_id as id_pedido
  , o.customer_id as id_cliente
  , orvw.review_creation_date as data_avaliacao
  , orvw.review_answer_timestamp as timestamp_resposta
  , orvw.review_score as nota_avaliacao
  , orvw.review_comment_title as titulo_avaliacao
  , orvw.review_comment_message as comentario_avaliacao


FROM `olist-analytics.curated_olist.order_reviews` orvw

JOIN `olist-analytics.curated_olist.orders` o
  ON o.order_id = orvw.order_id