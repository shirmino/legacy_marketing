
WITH ads AS (

    SELECT
        ad_id,
        ad_name,
        ad_group_id,
        ad_updated_at

    FROM {{ ref('stg_snapchat_ads') }}

),

final AS (

    SELECT
        ad_id,
        ad_name,
        ad_group_id,
        ad_updated_at

    FROM ads

)

SELECT *
FROM final
