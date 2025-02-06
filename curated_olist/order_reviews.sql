CREATE TABLE `olist-analytics.curated_olist.order_reviews` AS
SELECT 
  CAST(review_id AS STRING) AS review_id,
  CAST(order_id AS STRING) order_id,
  CAST(review_score AS INT64) AS review_score,
  CAST(review_comment_title AS STRING) AS review_comment_title,
  CAST(review_comment_message AS STRING) AS review_comment_message,
  DATE(TIMESTAMP(review_answer_timestamp)) AS review_creation_date,
  TIMESTAMP(review_answer_timestamp) AS review_answer_timestamp
FROM `olist-analytics.raw_olist.order_reviews` 