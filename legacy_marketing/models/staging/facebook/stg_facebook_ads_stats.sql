
WITH source AS (

    SELECT
        ad_id,
        account_id,
        ad_spend,
        ad_impressions,
        ad_clicks,
        ad_date

    FROM {{ source('facebook', 'facebook_ads_stats') }}

),

renamed AS (

    SELECT
        ad_id,
        account_id,

        TRY_CAST(ad_spend AS DECIMAL(18, 4))
            AS spend,

        TRY_CAST(ad_impressions AS BIGINT)
            AS impressions,

        TRY_CAST(ad_clicks AS BIGINT)
            AS clicks,

        ad_date

    FROM source

)

SELECT *
FROM renamed
