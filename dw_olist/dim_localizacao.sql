CREATE OR REPLACE TABLE `olist-analytics.dw_olist.dim_localizacao` AS

SELECT 
  md5(geolocation_zip_code_prefix) as chv_localizacao
  , geolocation_zip_code_prefix as cep_prefixo 
  --, geolocation_lat as geo_lat
  --, geolocation_lng as geo_long
  --, ST_GEOGPOINT(geolocation_lng,geolocation_lat) AS ponto_geografico
  , LOWER(
    TRANSLATE(geolocation_city,
      'ÁÀÂÃÄÉÈÊËÍÌÎÏÓÒÔÕÖÚÙÛÜÇáàâãäéèêëíìîïóòôõöúùûüç',
      'AAAAAEEEEIIIIOOOOOUUUUCaaaaaeeeeiiiiooooouuuuc'
    )) as municipio_padronizado
  , geolocation_state as UF

FROM `olist-analytics.curated_olist.geolocation` 
GROUP BY 1,2,3,4