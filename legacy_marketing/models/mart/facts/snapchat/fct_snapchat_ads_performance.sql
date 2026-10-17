
{{
    config(
        materialized='incremental',
        incremental_strategy='merge',
        unique_key=[
            'ad_id',
            'ad_date',
            'country',
            'currency_code',
            'data_src'
        ],
        on_schema_change='fail'
    )
}}

WITH performance AS (

    SELECT
        ad_id,
        ad_group_id,
        campaign_id,
        ad_date,
        country,
        currency_code,
        data_src,
        spend,
        impressions,
        clicks

    FROM {{ ref('int_snapchat_ads_performance') }}

),

final AS (

    SELECT
        ad_id,
        ad_group_id,
        campaign_id,
        ad_date,
        country,
        currency_code,
        data_src,
        spend,
        impressions,
        clicks

    FROM performance

)

SELECT *
FROM final
