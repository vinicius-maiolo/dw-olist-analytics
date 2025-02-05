CREATE TABLE `olist-analytics.dw_olist.dim_tempo` AS

WITH array_datas AS (
  SELECT
    GENERATE_DATE_ARRAY('2016-01-01', '2019-01-01') AS datas
)

, cte_chv_tempo AS(
SELECT
  dt as chv_tempo
FROM
  array_datas,
  UNNEST(datas) AS dt
)

SELECT
  DATE(chv_tempo) as chv_tempo,
  EXTRACT(YEAR FROM chv_tempo) AS ano,
  EXTRACT(MONTH FROM chv_tempo) AS mes,
  EXTRACT(DAY FROM chv_tempo) AS dia,
  EXTRACT(DAYOFWEEK FROM chv_tempo) AS dia_da_semana,
  CASE
    WHEN EXTRACT(DAYOFWEEK FROM chv_tempo) IN (1, 7) THEN TRUE
    ELSE FALSE
  END AS fim_de_semana
FROM cte_chv_tempo