
{{
    config(
        materialized='incremental',
        incremental_strategy='merge',
        unique_key=['ad_id', 'ad_date'],
        on_schema_change='fail'
    )
}}

WITH performance AS (

    SELECT
        ad_id,
        account_id,
        campaign_id,
        ad_group_id,
        ad_date,
        currency_code,
        spend,
        impressions,
        clicks

    FROM {{ ref('int_facebook_ads_performance') }}

),

final AS (

    SELECT
        ad_id,
        account_id,
        campaign_id,
        ad_group_id,
        ad_date,
        currency_code,
        spend,
        impressions,
        clicks

    FROM performance

)

SELECT *
FROM final
