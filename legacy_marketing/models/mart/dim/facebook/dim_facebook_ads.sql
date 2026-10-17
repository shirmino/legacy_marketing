
WITH ads AS (

    SELECT
        ad_id,
        ad_name,
        ad_status,
        account_id,
        campaign_id,
        ad_group_id,
        ad_updated_at

    FROM {{ ref('stg_facebook_ads') }}

),

final AS (

    SELECT
        ad_id,
        ad_name,
        ad_status,
        account_id,
        campaign_id,
        ad_group_id,
        ad_updated_at

    FROM ads

)

SELECT *
FROM final
