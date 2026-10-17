
WITH source AS (

    SELECT
        ad_detail_id,
        ad_currency_code,
        ad_country,
        ad_spend,
        ad_impressions,
        ad_clicks,
        ad_date,
        data_src

    FROM {{ source('snapchat', 'snapchat_ads_stats') }}

),

renamed AS (

    SELECT
        ad_detail_id AS ad_id,
        ad_currency_code AS currency_code,
        ad_country AS country,
        TRY_CAST(ad_spend AS DECIMAL(18, 4)) AS spend,
        TRY_CAST(ad_impressions AS BIGINT) AS impressions,
        TRY_CAST(ad_clicks AS BIGINT) AS clicks,
        ad_date,
        data_src

    FROM source

)

SELECT *
FROM renamed
